FROM beevelop/android

ENV NODE_VERSION=8.9.0

RUN apt install -y curl
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
ENV NVM_DIR=/root/.nvm
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"
RUN node --version
RUN npm --version


ENV IONIC_VERSION=2.2.0
ENV CORDOVA_VERSION=8.8.1

RUN npm install -g --unsafe-perm ionic@${IONIC_VERSION} && \
    ionic --version && \
    pm install -g --unsafe-perm cordova@${CORDOVA_VERSION} && \
    cordova --version && \
    npm install -g yarn && \
    yarn -v && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*