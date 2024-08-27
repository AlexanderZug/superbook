FROM python:3.4-alpine

RUN apk update && apk add --no-cache \
    jpeg-dev \
    zlib-dev

WORKDIR /app

COPY requirements.txt /app

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY . /app

EXPOSE 8000
RUN chmod +x runner/django_run.sh

ENTRYPOINT ["/bin/sh", "runner/django_run.sh"]
