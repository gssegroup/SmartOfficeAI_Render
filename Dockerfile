# Базовый образ Python
FROM python:3.10-slim

# Устанавливаем системные зависимости
RUN apt-get update && apt-get install -y --no-install-recommends gcc \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем зависимости
COPY requirements.txt .

# Устанавливаем Python-зависимости
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Копируем всё содержимое проекта внутрь контейнера
COPY . .

# Запускаем FastAPI (файл лежит в backend/main.py)
CMD ["uvicorn", "backend.main:app", "--host", "0.0.0.0", "--port", "10000"]
