FROM python:3.10

WORKDIR /ws

RUN pip install --upgrade pip
RUN pip install scipy numpy matplotlib sympy

COPY ./scripts .