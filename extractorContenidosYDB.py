# Packages
import sys
import requests
from bs4 import BeautifulSoup
import mysql.connector

#Mostrarmos un mensaje si no se le pasan parametros.
if len(sys.argv) != 4:
	print("Debes pasar los tres argumentos.")
else:
    # URL inicial
    url = sys.argv[1]
    # Base de la URL que utilizare para añadir a los a href
    base_URL = 'https://uvirtual.ujaen.es'

    # Hacemos HTTP GET request a la URL inicial(url)
    response = requests.get(url)

    # Contenido de la página que parsearemos
    content = BeautifulSoup(response.text, 'lxml')

    # Extraer todas las URLs donde se encuentra los PDFs
    all_urls = content.find_all('a', href=True)

    #Vectores y listas de los datos que necesitaremos
    previewURLs = []
    fecha = sys.argv[3]
    checkLink = '/p/' + fecha
    if checkLink + '/5/' in url:
        grado = sys.argv[2] + " EPS Linares"
    else:
        grado = sys.argv[2]
    conexion1 = mysql.connector.connect(host="localhost", user="root", passwd="", database="IAguiasUJA")
    cursor1 = conexion1.cursor()

    sql = "INSERT INTO `guia`(`id`, `nombre`, `id_grado`, `anio`, `link`) VALUES (%s,%s,%s,%s,%s)"
    obtenerIdGrado = "SELECT id FROM `grado` WHERE `nombre` = " + "'" + grado + "'"
    try:
        cursor1.execute(obtenerIdGrado)
        idGrado = str(cursor1.fetchone()).replace("(", "").replace(",)", "")
    except Exception as e:
        print('ErrorObtenerIdGrado:' + e)

    idCompo = []

    # Loop para recorrer todos los enlaces de all_URLs y guardar la información para crear el archivo csv que utilizaremos para la base de datos
    for url in all_urls:
        # Cogemos solo las URLs que nos llevan a las guias docentes
        try:
            # Estan son las posibles direcciones en la que se  pueden encontrar los archivos, por lo que las comprobamos
            # para solo acceder a los enlaces que necesitamos
            if checkLink + '/1/' in url['href'] or checkLink + '/2/' in url['href'] \
                or checkLink + '/3/' in url['href'] or checkLink + '/4/' in url['href'] \
                or checkLink + '/5/' in url['href'] or checkLink + '/6/' in url['href'] \
                or checkLink + '/7/' in url['href'] or checkLink + '/200' in url['href'] \
                or checkLink + '/204/' in url['href']   or checkLink + '/205/' in url['href'] \
                    or checkLink + '/300/' in url['href']:

                    next_URL = ''
                    # Tenemos que añadir base_URL puesto que el enlace de url['href'] no contiene toda la información que necesitamos
                    next_URL = base_URL + url['href']
                    previewURLs.append(next_URL)
                    idGuia = url['href'].split('/')[-1].replace(fecha + "-","").replace("_es.html","")
                    idCompo.append(idGuia)

                    # Insertamos en la base de datos
                    try:
                        datos = (idGuia, url.text, idGrado, fecha, next_URL)
                        cursor1.execute(sql, datos)
                        conexion1.commit()
                    except Exception as e:
                        print('Error1:' + e)

        # Las demás URLs las descartamos
        except Exception as e:
            print('Error1:', e)

    # Contador que utilizaremos para extraer los datos que necesitemos de idCompo
    countID = 0

    # Recorremos ahora todas las URLs que antes hemos obtenido para obtener el contenido de las Guias
    for preURL in previewURLs:
        response2 = requests.get(preURL)
        content2 = BeautifulSoup(response2.text, 'lxml')

        # Almacenamos el contenido de las guías en contenidoGuia
        htmlcontenido = content2.find_all("div", {"class": "gdoc_dato100"})
        count = 1
        for tag in htmlcontenido:
            if count == 2:
                contenidoGuia = tag.text
                break;
            count += 1

        try:
            # Actualizamos el campo contenido de Guia que hasta este momento era NULL
            filename = idCompo[countID]
            sql2 = "UPDATE `guia` SET `contenido`='" + contenidoGuia + "' WHERE `id` = " + "'" + filename + "'"
            try:
                cursor1.execute(sql2)
                conexion1.commit()
            except Exception as e:
                print('ErrorDBcontenidosguias:' + filename + ":" + e)
        except Exception as e:
            print('Error2:', e)

        countID += 1

    conexion1.close()

    print("Final")