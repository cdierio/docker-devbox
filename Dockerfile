FROM ubuntu:14.04
MAINTAINER Peter Grund, peter.grund@bisnode.de

# create user 'dev', allow sudo
RUN useradd -d /home/dev -ms /bin/bash -k /root/ dev; \
	 echo "dev ALL=NOPASSWD:ALL" >> /etc/sudoers; 

# using bash as default
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# install via apt-get and clean up
RUN  apt-get update && apt-get install -y subversion git vim nano wget curl python-dev python-pip python-setuptools build-essential xmlstarlet jq ;\
 apt-get clean; \
 rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN yes | pip install csvkit

 # Install bash completion
ADD ./bash_completion-git /etc/bash_completion.d/git
ADD ./bash_completion-svn /etc/bash_completion.d/svn

RUN echo "for file in /etc/bash_completion.d/* ; do  source $file; done" >> /home/dev/.bashrc

WORKDIR "/home/dev/app"

VOLUME [ "/home/dev/app"]

CMD ["/bin/bash"]