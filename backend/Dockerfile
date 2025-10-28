# Используем официальный образ Python
FROM python:3.10-slim

# Устанавливаем системные зависимости
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    && apt-get clean

# Создаем рабочую директорию
WORKDIR /app

# Копируем весь проект в контейнер
COPY . /app/

# Устанавливаем зависимости Python
RUN pip install --upgrade pip
RUN pip install -r backend/requirements.txt || true

# Устанавливаем рабочую директорию на backend
WORKDIR /app/backend

# Запускаем сервер FastAPI
CMD  ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "10000"]
