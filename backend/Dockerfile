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
COPY requirements.txt .

# Устанавливаем зависимости Python
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Копируем весь код проекта внутрь контейнера
COPY . .

# Указываем команду запуска FastAPI
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "10000"]
