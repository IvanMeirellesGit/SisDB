import pycopg2
from sisdb.config import DB_USER, DB_PASSWORD, DB_NAME, DB_HOST, DB_PORT

def conect_postgres():
    try:
        conn = pycopg2.connect(
            dbname=DB_NAME,
            user=DB_USER,
            paswd=DB_PASSWORD,
            host=DB_HOST,
            port=DB_PORT
        )
        print("Coneção bem sucedida com o PostgreSQL!")
        return conn
    except Exception as e:
        print("Erro ao conectar ao PostgreSQL:", e)
        return None