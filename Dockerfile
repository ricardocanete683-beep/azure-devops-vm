# Imagen base ligera de Python
FROM python:3.11-slim

# Variables para evitar archivos .pyc y mejorar logs
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Directorio de trabajo dentro del contenedor
WORKDIR /app

# Instalar dependencias
COPY app/requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

# Copiar el código de la aplicación
COPY app /app

# Exponer el puerto de la aplicación
EXPOSE 8000

# Comando de inicio
CMD ["python", "src/app.py"]
