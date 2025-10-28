# Используем официальный образ Python
FROM python:3.10-slim

# Устанавливаем системные зависимости
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    && apt-get clean

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем зависимости проекта
COPY backend/requirements.txt /app/

# Устанавливаем зависимости Python
RUN pip install --upgrade pip
RUN pip install -r requirements.txt || true

# Копируем весь код backend в /app/backend
COPY backend /app/backend

# Устанавливаем рабочую директорию backend
WORKDIR /app/backend

# Запускаем сервер FastAPI
CMD ["uvicorn", "backend.main:app", "--host", "0.0.0.0", "--port", "10000"]
