FROM debian:10
COPY ./start.sh /start.sh
RUN chmod +x /start.sh
WORKDIR /usr/src/app
RUN apt-get update
RUN apt-get install -y software-properties-common curl python3 python3-pip nano sudo gcc g++ make

RUN curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
RUN apt-get update
RUN apt-get -y install nodejs
RUN apt-get -y install yarn
RUN npm install -g node-dev

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt  \
-subj "/C=CA/ST=Halifax/L=Halifax/O=Umbradawn/OU=IT Department/CN=ar.app"

COPY . .
CMD [ "/start.sh" ]