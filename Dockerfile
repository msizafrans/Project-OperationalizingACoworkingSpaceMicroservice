FROM python:3.10-slim-buster

WORKDIR /src

COPY requirements.txt .

#upgrades the pip package manager to the latest version and then installs the dependencies listed in the requirements.txt
RUN pip install --upgrade pip && pip install -r requirements.txt

COPY . .

#command to be executed when a container is started from the image
CMD python /src/app.py