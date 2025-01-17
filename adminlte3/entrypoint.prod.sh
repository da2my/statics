#!/bin/sh

if [ "$DATABASE" = "adminlte3" ]
then
    echo "Waiting for postgres..."

    while ! nc -z $SQL_HOST $SQL_PORT; do
      sleep 0.1
    done

    echo "PostgreSQL started"
fi

python manage.py makemigrations
python manage.py migrate --noinput
python manage.py collectstatic --noinput

exec "$@"
