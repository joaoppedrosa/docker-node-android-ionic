FROM beevelop/android

ENV NODE_VERSION 8.9.0
ENV IONIC_VERSION 2.2.0

RUN apt-get update && apt-get install -y curl gnupg2 lsb-release && \
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
    apt-key fingerprint 1655A0AB68576280 && \
    export VERSION=node_${NODE_VERSION} && \
    export DISTRO="$(lsb_release -s -c)" && \
    echo "deb https://deb.nodesource.com/$VERSION $DISTRO main" | tee /etc/apt/sources.list.d/nodesource.list && \
    echo "deb-src https://deb.nodesource.com/$VERSION $DISTRO main" | tee -a /etc/apt/sources.list.d/nodesource.list && \
    apt-get update && apt-get install -y nodejs && \
    node -v && npm -v && \
    npm install -g --unsafe-perm @ionic/cli@${IONIC_VERSION} && \
    ionic --version && \
    npm install -g yarn && \
    yarn -v && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*