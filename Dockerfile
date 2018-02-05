FROM node:8

MAINTAINER George Kharrat <dkgeorge@gmail.com>

EXPOSE 3001 

USER root

RUN npm config set unsafe-perm=true
RUN npm install -g github:bitpay/bitcore#v5.0.0-beta.44
RUN npm install -g github:bitpay/insight-api#v5.0.0-beta.44
RUN npm install -g github:bitpay/insight-ui#v5.0.0-beta.44
RUN useradd -m -d /home/bitcore -s /bin/bash bitcore
RUN chown -R bitcore:bitcore /usr

USER bitcore

ENV HOME /home/bitcore
RUN bitcore create /home/bitcore/bitcore-node
RUN cd /home/bitcore/bitcore-node

ENTRYPOINT [ "bitcored" ]
