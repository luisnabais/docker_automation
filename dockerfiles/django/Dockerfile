FROM python:3.6.1

RUN mkdir /code
WORKDIR /code

ADD requirements.txt /code/
ADD code/. /code/

RUN pip install requirements.txt

EXPOSE 8000
CMD python manage.py runserver 0.0.0.0:8000
