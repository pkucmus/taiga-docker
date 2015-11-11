FROM nginx

RUN rm -f /etc/nginx/conf.d/*
COPY etc/nginx.conf /etc/nginx/conf.d/nginx.conf
COPY taiga-front-dist /var/run/front
COPY etc/front.json /var/run/front/dist/js/conf.json
