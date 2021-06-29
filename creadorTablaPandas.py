import mysql.connector as sql
import pandas as pd
import torch
# Cargamos tokenizador y modelo BERT para español
from transformers import BertTokenizer, BertModel
tokenizer = BertTokenizer.from_pretrained('dccuchile/bert-base-spanish-wwm-uncased')
model = BertModel.from_pretrained('dccuchile/bert-base-spanish-wwm-uncased')

def text_to_vec(text, model):
  """ Genera un vector a partir de un texto """
  input = tokenizer(text)
  input_ids = torch.tensor([input.input_ids[:512]])
  attention_mask = torch.tensor([input.attention_mask[:512]])
  output = model(input_ids, attention_mask)
  return output.last_hidden_state[0][0]

db_connection = sql.connect(host='localhost', user='root', password='', database='IAguiasUJA')

db_cursor = db_connection.cursor()

db_cursor.execute('SELECT `id`, `contenido` FROM `guia`WHERE length(`contenido`) > 400')

contenidoDB = db_cursor.fetchall()

df = pd.DataFrame(contenidoDB, columns=['id','contenido'])

pd.options.display.max_colwidth = 512  #.set_option('display.max_colwidth', None)

df.contenido = df.contenido.replace(r'\n', ' ', regex=True).replace('\r', '', regex=True).replace('\t', '', regex=True)

df['vec'] = [text_to_vec(t, model).tolist() for t in df['contenido']]

print(df)

df.to_pickle("./pdGUIA.pkl")