FROM python:3.4

RUN apt-get update; apt-get install -y \
    build-essential binutils-doc autoconf flex bison libjpeg-dev \
    libfreetype6-dev zlib1g-dev libzmq3-dev libgdbm-dev libncurses5-dev \
    automake libtool libffi-dev curl git tmux gettext libxml2-dev libxslt-dev

RUN pip3 install uwsgi

RUN mkdir -p /var/run/app
WORKDIR /var/run/app
COPY taiga-back/requirements.txt /var/run/app/requirements.txt

RUN pip3 install -r requirements.txt

COPY taiga-back /var/run/app
COPY etc/local.py /var/run/app/settings/local.py

# RUN python manage.py migrate --noinput
# RUN python manage.py loaddata initial_user
# RUN python manage.py loaddata initial_project_templates
# RUN python manage.py loaddata initial_role
RUN python manage.py compilemessages
RUN python manage.py collectstatic --noinput

COPY etc/uwsgi.ini /var/run/uwsgi.ini

VOLUME ["/var/run/app/media", "/var/run/app/static"]

CMD ["uwsgi", "--ini", "/var/run/uwsgi.ini"]

