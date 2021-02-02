# Name of image we are going to pull
FROM python:3.7-alpine

# Setting env to unbuffered (meaning all outputs will be printed directly)
ENV PYTHONUNBUFFERED 1

# Copying reqs to root and running pip install
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

# Creating empty folder and switching to it as work folder
# Copying files to work dir
RUN mkdir /app
WORKDIR /app
COPY ./app /app

# Adding user 'user' and switching to this user
RUN adduser -D user
USER user
