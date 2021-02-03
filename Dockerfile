# Name of image we are going to pull
FROM python:3.7-alpine

# Setting env to unbuffered (meaning all outputs will be printed directly)
ENV PYTHONUNBUFFERED 1

# Copying reqs to root and running pip install
COPY ./requirements.txt /requirements.txt
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps \
      gcc libc-dev linux-headers postgresql-dev
RUN pip install -r /requirements.txt
RUN apk del .tmp-build-deps

# Creating empty folder and switching to it as work folder
# Copying files to work dir
RUN mkdir /app
WORKDIR /app
COPY ./app /app

# Adding user 'user' and switching to this user
RUN adduser -D user
USER user
