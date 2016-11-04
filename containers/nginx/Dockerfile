FROM nginx
RUN systemctl stop nginx
RUN apt-get update
RUN apt-get install git
RUN apt-get install python2
RUN git clone https://github.com/certbot/certbot /usr/local/certbot/
RUN /usr/local/certbot/certbot-auto certonly --standalone -d himanoa.com
COPY nginx.conf /etc/nginx/nginx.conf
RUN systemctl start nginx
