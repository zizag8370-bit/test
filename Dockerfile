# Cloud Run container for Flask
FROM python:3.11-slim

# Prevent Python from writing .pyc files and enable unbuffered logs
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Cloud Run sets PORT; default to 8080
ENV PORT=8080

# Use gunicorn for production
CMD exec gunicorn --bind :$PORT app:app
