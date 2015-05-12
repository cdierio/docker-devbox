FROM ubuntu:14.04
MAINTAINER Peter Grund, peter.grund@bisnode.de

# create user 'dev', allow sudo
RUN useradd -d /home/dev -ms /bin/bash -k /root/ dev; \
	 echo "dev ALL=NOPASSWD:ALL" >> /etc/sudoers; 

# using bash as default
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# install via apt-get
RUN apt-get update && apt-get install -y npm git vim ruby xdg-utils lynx

# update npm, fix nodejs naming
RUN npm install -g npm@latest; \
	 ln -s /usr/bin/nodejs /usr/bin/node
RUN gem install sass

# install npm modules as user with sudo (e.g. yo, ...)
USER dev
RUN sudo npm install -g grunt-cli gulp bower yo generator-angular-fullstack

# general cleanup
RUN sudo npm cache clean

WORKDIR "/home/dev"

VOLUME [ "/app"]

EXPOSE 9000
