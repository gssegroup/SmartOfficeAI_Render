FROM python:3.10-slim

WORKDIR /app

# Сначала зависимости
COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Теперь явно копируем backend
COPY ./backend /app/backend

ENV PYTHONPATH=/app

# Запуск сервера
CMD ["uvicorn", "backend.main:app", "--host", "0.0.0.0", "--port", "8080"]
