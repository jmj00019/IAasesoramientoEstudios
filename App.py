from flask import Flask, render_template, request, redirect, url_for, flash
from flask_mysqldb import MySQL
import pandas as pd
from transformers import BertTokenizer, BertModel
import torch
import torch.nn as nn

# Cargamos tokenizador y modelo BERT para español
tokenizer = BertTokenizer.from_pretrained('dccuchile/bert-base-spanish-wwm-uncased')
model = BertModel.from_pretrained('dccuchile/bert-base-spanish-wwm-uncased')

app = Flask(__name__)
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'iaguiasuja'
mysql = MySQL(app)

df = pd.read_pickle("./pdGuia.pkl")
nTopAsignaturas = 10 # Variable global utiliza para indicar el TOP de asignaturas que se mostrara en la página Resultado
nMejorGrado = 20 # Variable global utilizada para calcular el mejor grado
nTOPGrados = 5 # Variable global utilizada para calcular los cinco mejores grados

def text_to_vec(text, model):
  """ Genera un vector a partir de un texto """
  input = tokenizer(text)
  input_ids = torch.tensor([input.input_ids[:512]])
  attention_mask = torch.tensor([input.attention_mask[:512]])
  output = model(input_ids, attention_mask)
  return output.last_hidden_state[0][0]

def similar_text_indexes(qvec, text_vecs, ntop):
  dist = nn.functional.cosine_similarity(text_vecs, qvec.unsqueeze(0))
  index_sorted = torch.argsort(dist, descending=True)
  return index_sorted[:ntop], dist

def completarDatosGuias(df, similars, dist):
    distancias = []
    guiasTOP = []
    linkGuias = []
    anios = []
    gradosTOP = []
    linkGrados = []

    cursor = mysql.connection.cursor()

    for i in similars.tolist():
        distancias.append(round(dist[i].item() * 100, 2))  # Redondeamos a dos decimales para obtener un porcentaje

        cursor.execute('SELECT nombre FROM guia WHERE id = %s', ([df.iloc[i, 0]]))
        nameGuia = str(cursor.fetchall()).replace("(('", "").replace("',),)", "")
        guiasTOP.append(nameGuia)
        cursor.execute('SELECT link FROM guia WHERE id = %s', ([df.iloc[i, 0]]))
        linkGuia = str(cursor.fetchall()).replace("(('", "").replace("',),)", "")
        linkGuias.append(linkGuia)
        cursor.execute('SELECT anio FROM guia WHERE id = %s', ([df.iloc[i, 0]]))
        anioGuia = str(cursor.fetchall()).replace("(('", "").replace("',),)", "")
        anios.append(anioGuia)

        cursor.execute('SELECT id_grado FROM guia WHERE id = %s', ([df.iloc[i, 0]]))
        idGrado = int(str(cursor.fetchall()).replace("((", "").replace(",),)", ""))
        cursor.execute('SELECT nombre FROM grado WHERE id = %s', ([idGrado]))
        nameGrado = str(cursor.fetchall()).replace("(('", "").replace("',),)", "")
        gradosTOP.append(nameGrado)
        cursor.execute('SELECT link FROM grado WHERE id = %s', ([idGrado]))
        linkGrado = str(cursor.fetchall()).replace("(('", "").replace("',),)", "")
        linkGrados.append(linkGrado)

    cursor.close()

    return guiasTOP, linkGuias, anios, gradosTOP, linkGrados, distancias

def calcularMejorGrado(df, similars, dist):

    gradosTOP5 = []
    linkGrados5 = []
    sumaGrado = pd.DataFrame(columns=['idGrado','suma'])
    cursor = mysql.connection.cursor()

    for i in similars.tolist():
        cursor.execute('SELECT id_grado FROM guia WHERE id = %s', ([df.iloc[i, 0]]))
        idGrado = int(str(cursor.fetchall()).replace("((", "").replace(",),)", ""))
        sumaGrado = sumaGrado.append({'idGrado' : idGrado, 'suma': dist[i].item()}, ignore_index=True)

    sumaGrado = sumaGrado.groupby("idGrado").agg({"suma": "sum"}, descending=True)
    sumaGrado = sumaGrado.sort_values('suma', ascending=False)

    indices = sumaGrado.index.values.tolist()
    cursor.execute('SELECT nombre FROM grado WHERE id = %s', ([indices[0]]))
    nameGrado = str(cursor.fetchall()).replace("(('", "").replace("',),)", "")
    cursor.execute('SELECT link FROM grado WHERE id = %s', ([indices[0]]))
    linkGrado = str(cursor.fetchall()).replace("(('", "").replace("',),)", "")

    for i in range(nTOPGrados):
        cursor.execute('SELECT nombre FROM grado WHERE id = %s', ([indices[i]]))
        nameGrado = str(cursor.fetchall()).replace("(('", "").replace("',),)", "")
        gradosTOP5.append(nameGrado)
        cursor.execute('SELECT link FROM grado WHERE id = %s', ([indices[i]]))
        linkGrado = str(cursor.fetchall()).replace("(('", "").replace("',),)", "")
        linkGrados5.append(linkGrado)

    return nameGrado, linkGrado, gradosTOP5, linkGrados5


@app.route('/')
def Index():
    return render_template('index.html')

@app.route('/about')
def about():
    return render_template('about.html')

@app.route('/resultado', methods=["POST"])
def resultado():
    if request.method == 'POST':
        consulta = request.form['textCommentary']

        vecConsulta = text_to_vec(consulta, model)
        vecs = torch.tensor(df['vec'])

        similars, dist = similar_text_indexes(vecConsulta, vecs, nTopAsignaturas)
        guiasTOP, linkGuias, anios, gradosTOP, linkGrados, distancias = completarDatosGuias(df, similars, dist)
        listaFinal = list(zip(guiasTOP, linkGuias, anios, gradosTOP, linkGrados, distancias))

        listaMejorGrado, distGrado = similar_text_indexes(vecConsulta, vecs, nMejorGrado)
        nameMejorGrado, linkMejorGrado, gradosTOP5, linkGrados5 = calcularMejorGrado(df, listaMejorGrado, distGrado)
        listaTOPGrados = list(zip(gradosTOP5, linkGrados5))


        return render_template('resultado.html', listaAsignaturas = listaFinal, grado = nameMejorGrado,
                               topGrados = listaTOPGrados, linkGrado = linkMejorGrado)

@app.errorhandler(404)
def page_not_found(error):
    return render_template("pagina_no_encontrada.html"), 404

if __name__ == '__main__':
    app.run(port=3000, debug=True)