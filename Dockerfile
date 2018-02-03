FROM node:8

EXPOSE 3001 
#8333 18333
USER root
RUN npm config set unsafe-perm=true
RUN npm install -g github:bitpay/bitcore#v5.0.0-beta.44
RUN npm install -g github:bitpay/insight-api#v5.0.0-beta.44
RUN npm install -g github:bitpay/insight-ui#v5.0.0-beta.44
RUN groupadd bitcore
RUN useradd -m -d /home/bitcore -s /bin/bash bitcore
RUN chown -R bitcore:bitcore /home/bitcore
USER bitcore
ENV HOME /home/bitcore
RUN cd /home/bitcore
RUN bitcore create bitcore-node
RUN cd /home/bitcore/bitcore-node


ENTRYPOINT [ "bitcored" ]
