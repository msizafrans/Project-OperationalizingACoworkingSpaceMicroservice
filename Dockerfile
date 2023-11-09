FROM public.ecr.aws/docker/library/python:3.11-alpine

ENV FLASK_RUN_HOST=0.0.0.0

WORKDIR /app

# Required dependencies for psycopg2 (used for Postgres client)
RUN apk update && \
    apk add \
    pcre \
    pcre-dev \
    build-base \
    gcc \
    linux-headers \
    openssl \
    libffi-dev

COPY ./requirements.txt requirements.txt

# Installing dependencies during build time in the container itself so that we don't have OS mismatch
RUN pip install -r requirements.txt

COPY . .

CMD python app.py

