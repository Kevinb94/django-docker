FROM python:3.10-alpine3.17

RUN apk update


ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV APP_HOME=/app

WORKDIR $APP_HOME

# create the app user
# RUN addgroup -S app && adduser -S app -G app

RUN pip install --upgrade pip

COPY ./requirements.txt /tmp/requirements.txt

RUN pip install -r /tmp/requirements.txt && \
    rm /tmp/requirements.txt

COPY script.sh /app

# Make script executable
RUN chmod u=rwx,g=rwx,o=rwx /app/script.sh

# chown all the files to the app user
# RUN chown -R app:app $APP_HOME

# change to the app user
# USER app




