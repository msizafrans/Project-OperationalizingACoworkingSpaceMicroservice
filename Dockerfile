FROM public.ecr.aws/docker/library/python:3.11-alpine

# Environment variable used by Flask to specify the host on which the application will run
ENV FLASK_RUN_HOST=0.0.0.0

# Set the container working directory
WORKDIR /app

# Install and run package updates, libraries, and tools needed for for this app
RUN apk update && \
    apk add \
    pcre \
    pcre-dev \
    build-base \
    gcc \
    linux-headers \
    openssl \
    libffi-dev

# Copy the requirements.txt file from the host machine to the /app directory inside the container
COPY requirements.txt .

# Installing dependencies during build time in the container itself so we don't have OS mismatch
RUN pip install --no-cache-dir -r requirements.txt

# Copy all the files and directories from the current directory on the host machine to the /app directory inside the container.
COPY . .

# Start the Flask application
CMD  python app.py