FROM ubuntu:14.04
MAINTAINER Peter Grund, peter.grund@bisnode.de

# create user 'dev', allow sudo
RUN useradd -d /home/dev -ms /bin/bash -k /root/ dev; \
	 echo "dev ALL=NOPASSWD:ALL" >> /etc/sudoers; 

# using bash as default
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# install via apt-get and clean up
RUN  apt-get update && apt-get install -y subversion git vim nano wget curl build-essential ;\
 apt-get clean; \
 rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR "/home/dev/app"

VOLUME [ "/home/dev/app"]

CMD ["/bin/bash"]