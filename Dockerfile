FROM node:8

EXPOSE 3001 

USER root

RUN npm install -g github:bitpay/bitcore#v5.0.0-beta.44
RUN npm install -g github:bitpay/insight-api#v5.0.0-beta.44
RUN npm install -g github:bitpay/insight-ui#v5.0.0-beta.44
RUN useradd -m -d /home/bitcore -s /bin/bash bitcore

USER bitcore

ENV HOME /home/bitcore
RUN bitcore create /home/bitcore/bitcore-node
RUN cd /home/bitcore/bitcore-node

ENTRYPOINT [ "bitcored" ]
