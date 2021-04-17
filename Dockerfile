FROM python:3.7-alpine

# preferred setup for python in a container?
ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

# -d allow exec for running things in the container
# switch to the user instead of root. limits vulnerability
RUN adduser -D user
USER user


