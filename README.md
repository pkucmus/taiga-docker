#Installation

## Prerequisites

    pip install docker-compose

## Configuration

Edit `etc/front.json` so that it fits your need. Also copy (or rename) `etc/local.example.py` to `etc/local.py` and edit it.
Optionally edit `etc/nginx.conf` and `etc/uwsgi.ini`.

## Running Taiga

    docker-compose up -d

## Onetime (after a clean database is made)

    docker-compose run --rm back bash

    python manage.py migrate --noinput
    python manage.py loaddata initial_user
    python manage.py loaddata initial_project_templates
    python manage.py loaddata initial_role
