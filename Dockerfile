FROM public.ecr.aws/docker/library/python:3.11-alpine

ENV FLASK_RUN_HOST=0.0.0.0

USER root

WORKDIR /src

COPY ./requirements.txt requirements.txt

# Required dependencies for psycopg2 (used for Postgres client)
RUN apt update -y && apt install -y build-essential libpq-dev

# Installing dependencies during build time in the container itself so we don't have OS mismatch
RUN pip install -r requirements.txt

COPY . .

CMD python app.py