import psycopg2
from sisdb.config import DB_USER, DB_PASSWORD, DB_NAME, DB_HOST, DB_PORT
from psycopg2 import OperationalError

def test_connection():
    try:
        with psycopg2.connect(
            dbname=DB_NAME,
            user=DB_USER,
            password=DB_PASSWORD,
            host=DB_HOST,
            port=DB_PORT
        ) as conn:
            print("Coneção bem sucedida com o PostgreSQL!")
            return conn
    except OperationalError as e:
        print(f"Erro ao conectar ao PostgreSQL: {e}")
    except Exception as e:
        print(f"Erro desconhecido: {e}")

# executa o teste de conexao assim que o pacote do test for importado
if __name__ == "__main__":
    test_connection()