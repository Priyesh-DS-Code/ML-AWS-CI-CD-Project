FROM python:3.13-slim-bookworm

WORKDIR /app

COPY requirements.txt /app/

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends awscli ffmpeg libsm6 libxext6 unzip && \
    pip install --no-cache-dir -r requirements.txt && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY . /app

EXPOSE 8080

CMD ["python3", "app.py"]