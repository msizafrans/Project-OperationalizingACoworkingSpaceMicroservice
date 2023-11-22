FROM python:3.10-slim-buster

WORKDIR /src

COPY requirements.txt .

RUN pip install --upgrade pip && pip install -r requirements.txt

COPY . .

#run the app
CMD python app.py