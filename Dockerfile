FROM centos:latest

EXPOSE 3001 
#8333 18333

RUN yum -y install git curl which xz tar findutils

RUN groupadd bitcore
RUN useradd bitcore -m -s /bin/bash -g bitcore
ENV HOME /home/bitcore

USER bitcore

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash
RUN /bin/bash -l -c "nvm install v4 && nvm alias default v4"
RUN /bin/bash -l -c "npm install -g npm install github:bitpay/bitcore#v5.0.0-beta.44"
RUN /bin/bash -l -c "npm install -g npm install github:bitpay/insight-api#v5.0.0-beta.44"
RUN /bin/bash -l -c "npm install -g npm install github:bitpay/insight-ui#v5.0.0-beta.44"

ENTRYPOINT [ "bitcored" ]
