FROM python:3.9-slim-buster

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

EXPOSE 8080

COPY . .

CMD ["gunicorn", "--bind", ":8080", "--threads", "4", "app:app"]
