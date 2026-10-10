import os
import psycopg2
from fastapi import FastAPI, HTTPException

app = FastAPI(title="Catalog API", description="API de catálogo de productos")

# Variables de entorno inyectadas por Kubernetes
DB_HOST = os.getenv("DB_HOST", "localhost")
DB_NAME = os.getenv("DB_NAME", "postgres")
DB_USER = os.getenv("DB_USER", "postgres")
DB_PASSWORD = os.getenv("DB_PASSWORD", "postgres")

def get_db_connection():
    try:
        conn = psycopg2.connect(
            host=DB_HOST,
            database=DB_NAME,
            user=DB_USER,
            password=DB_PASSWORD
        )
        return conn
    except Exception as e:
        print(f"Error conectando a la BD: {e}")
        return None

@app.get("/health")
def health_check():
    """Endpoint para liveness/readiness probes de Kubernetes"""
    return {"status": "ok"}

@app.get("/api/products")
def get_products():
    """Endpoint principal de la API"""
    conn = get_db_connection()
    if not conn:
        raise HTTPException(status_code=500, detail="No se pudo conectar a la base de datos")
    
    try:
        # Validación simple de conexión ejecutando un query
        cur = conn.cursor()
        cur.execute("SELECT 1;")
        cur.fetchone()
        cur.close()
        conn.close()
        # En la vida real, aquí harías un SELECT real a tu tabla de productos
        return [
            {"id": 1, "name": "Laptop Pro", "price": 1200},
            {"id": 2, "name": "Smartphone X", "price": 800}
        ]
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
    