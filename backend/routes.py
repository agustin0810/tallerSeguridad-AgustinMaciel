from flask import Flask, request, session
import bcrypt
from flask_cors import CORS
import mysql.connector
import sentry_sdk
from werkzeug.utils import secure_filename
import os

app = Flask(__name__)

_cors = CORS(
    app,
    supports_credentials=True,
    resources={r"/*": {"origins": "*"}}
)

app.secret_key = os.environ.get('SECRET_KEY')
UPLOAD_FOLDER = ".\public"

@app.route("/addPromo", methods=['POST'])
def addPromo():
    try:

        sentry_sdk.init(
            dsn="https://examplePublicKey@o0.ingest.sentry.io/0",

            # Set traces_sample_rate to 1.0 to capture 100%
            # of transactions for performance monitoring.
            # We recommend adjusting this value in production.
            traces_sample_rate=1.0,
        )
        body= request.json
        title = body['title']
        value= body['value']
        discount = body['discount']
        description = body['description']
        formData = body['formData']
        userSession = body['userSession']

        title = title.replace("'", "")
        value = value.replace("'", "")
        discount = discount.replace("'", "")
        description = description.replace("'", "")

        salt = bcrypt.gensalt()
        hashed = bcrypt.hashpw(title.encode('utf-8'), salt) 
        #hasheamos el titulo para probar el hasheo
        mydb = mysql.connector.connect(
            host="localhost",
            user="root",
            database="taller"
        )
        mycursor = mydb.cursor(buffered=True)
        sql = "SELECT usuario FROM usuario"
        mycursor.execute(sql)
        myresult = mycursor.fetchall()
        print(userSession)
        print(myresult)
        contr = False
        for item in myresult:
            if userSession == item[0]:
                
                contr=True

        if contr==True:

            try:
                #insertamos los datos, el titulo hasheado y hacemos commit para que se hagan los cambios
                #se inserta el titulo hasheado a modo de demostración del hasheo, en un producto real
                #no sería necesario, pero se implementa para poner en práctica los conceptos.

                sql = "INSERT INTO promocion (title, value, discount) VALUES (%s, %s, %s)"
                val = (hashed, value, discount)
                mycursor.execute(sql, val) # Usamos prepared statements para hacer el insert
                mydb.commit()

                #if not os.path.isdir('./img'):
                #    os.mkdir('./img')
                #filename = secure_filename(formData.filename)
                #destination=os.path.join('./img', filename)
                #file.save(destination)
                print("aaaaaaaa")
                return {'msg': "Se realizó la inserción con éxito"}
            except Exception as e:
                # Atrapar error
                return("Ocurrió un error al conectar con la BDD: ", e)
        else:
            print("Usuario no loggeado")
            return({'msg': "Usuario no loggeado:"})
    except Exception as ex:
        return({'msg': "Problemas con los datos recibidos", 'err': True})
        print(ex)


@app.route("/registro", methods=['POST'])
def registro():
    body = request.json
    user = body['user']
    password = body['password']

    user = user.replace("'", "")
    password = password.replace("'", "")
    
    salt = bcrypt.gensalt()
    hashed = bcrypt.hashpw(password.encode('utf-8'), salt) 
    print(hashed)
    try:
        mydb = mysql.connector.connect(
            host="localhost",
            user="root",
            database="taller"
        )
        mycursor = mydb.cursor(buffered=True)
        sql = "INSERT INTO usuario (usuario, password) VALUES (%s, %s)"
        val = (user, hashed)
        mycursor.execute(sql, val) # Usamos prepared statements para hacer el insert
        mydb.commit()
        return {'msg': "Registro realizado con éxito", 'err': False}

    except Exception as e:
        return({'msg': "Error en el inicio de sesión", 'err': True})

@app.route("/login", methods=['POST'])
def login():
    try:
        body = request.json
        user = body['user']
        password = body['password']

        user = user.replace("'", "")
        password = password.replace("'", "")

        mydb = mysql.connector.connect(
            host="localhost",
            user="root",
            database="taller"
        )
        cantidad = 0
        mycursor = mydb.cursor(buffered=True)
        try:
            sql = "SELECT cantidad from login_attempts WHERE usuario='"+user+"' and fecha=CURRENT_DATE;"

            mycursor.execute(sql)
            cantidad = mycursor.fetchall()[0][0]
        except:
            pass
        finally:

            mycursor.execute("SELECT * FROM usuario WHERE usuario='"+user+"';")

            myresult = mycursor.fetchall()
            if bcrypt.checkpw(password.encode(), myresult[0][1].encode()) and cantidad < 7:
                return {'msg': "Login realizado con éxito", 'err': False, 'session': user}
            else:
                sql ="SELECT * FROM login_attempts WHERE usuario='"+user+"';"
                mycursor.execute(sql)
                myresult = mycursor.fetchall()
                if myresult != []:

                    sql = "UPDATE login_attempts SET cantidad=cantidad+1 WHERE usuario='"+user+"';"
                    mycursor.execute(sql)
                    mydb.commit()
                    print(myresult)
                    return ({'err': True, 'msg': 'Login no realizado.'})
                else:
                    sql = "INSERT INTO login_attempts (usuario, cantidad) VALUES ('"+user+"', 1);"
                    val = (user)
                    print("a cursor")
                    mycursor.execute(sql) # Usamos prepared statements para hacer el insert
                    print("d cursor")
                    mydb.commit()
                    return ({'err': True, 'msg': 'Login no realizado.'})
                    

    except Exception as e:
        print(e)
        return({'err': True, 'msg': "Error al conectar con la BDD"})

app.run(debug = True)