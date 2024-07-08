# Image of Linux Debian 10 Operating System to host the Application
FROM python:3.9-slim-buster

WORKDIR /src

COPY requirements.txt .

RUN pip install --upgrade pip && pip install -r requirements.txt

COPY . .

CMD python app.py
