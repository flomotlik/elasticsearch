FROM maven:3

RUN mkdir -p /app
WORKDIR /app

add . /app
