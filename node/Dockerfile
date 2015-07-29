FROM pgrund/devbox:base
MAINTAINER Peter Grund, peter.grund@bisnode.de

ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 0.12.7

# Install nvm with node and npm
RUN curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash \
    && source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

ENV NODE_PATH $NVM_DIR/versions/node/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

ADD nvm.bash /root/.bash_it/custom/nvm.bash

# Install global npm packages
RUN npm install -g yo bower grunt-cli gulp \
    generator-angular generator-angular-fullstack generator-webapp generator-wordpress

# update bash-it plugins, completions, aliases ..
ENV BASH_IT_PLUGINS "nvm node"
ENV BASH_IT_ALIASES ""
ENV BASH_IT_COMPLETIONS "grunt gulp npm"

RUN /root/bash-it-activation.sh
