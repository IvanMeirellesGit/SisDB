import os
from dotenv import load_dotenv

# Carrega o .env
load_dotenv()

DB_USER = os.getenv("POSTGRES_USER")
DB_EMAIL = os.getenv("POSTGRES_EMAIL")
DB_PASSWORD = os.getenv("POSTGRES_PASSWORD")
DB_NAME = os.getenv("POSTGRES_DB")
DB_HOST = os.getenv("POSTGRES_HOST")
DB_PORT = os.getenv("POSTGRES_PORT")