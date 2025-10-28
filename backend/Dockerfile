# Базовый образ
FROM python:3.10-slim

# Системные пакеты (gcc на будущее, можно убрать)
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

# Рабочая директория внутри контейнера
WORKDIR /app

# Ставим зависимости ИЗ КОРНЯ репозитория
# (у тебя requirements.txt лежит в корне)
COPY requirements.txt ./requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Копируем КОД БЭКЕНДА (только папку backend/) внутрь контейнера в /app
COPY backend/ /app/

# Запуск FastAPI (main.py теперь находится прямо в /app)
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "10000"]
