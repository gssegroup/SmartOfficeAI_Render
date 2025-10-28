# Dockerfile для backend SmartOfficeAI
FROM python:3.11-slim

WORKDIR /app

# Встановлюємо системні бібліотеки, потрібні для PDF і шаблонів
RUN apt-get update && apt-get install -y \
    libpq-dev gcc wkhtmltopdf && \
    pip install --upgrade pip

# Копіюємо усі файли бекенду в контейнер
COPY . /app

# Встановлюємо залежності
RUN pip install fastapi uvicorn jinja2 pdfkit psycopg2-binary python-multipart

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
