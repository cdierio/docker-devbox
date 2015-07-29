FROM ubuntu:14.04
MAINTAINER Peter Grund, peter.grund@bisnode.de

# create user 'dev', allow sudo
RUN useradd -d /home/dev -ms /bin/bash -k /root/ dev; \
	 echo "dev ALL=NOPASSWD:ALL" >> /etc/sudoers;

# using bash as default
RUN rm /bin/sh && ln -s /bin/bash /bin/sh && ln -s /bin/bash /usr/bin/bash

# Set debconf to run non-interactively
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# install via apt-get and clean up
RUN  apt-get update && \
		 apt-get install -y software-properties-common python-software-properties unzip subversion git vim nano wget curl python-dev python-pip python-setuptools build-essential libssl-dev xmlstarlet jq;\
		 apt-get clean; \
 		 rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN yes | pip install csvkit pygments
RUN wget http://launchpadlibrarian.net/188304624/datamash_1.0.6-2_amd64.deb && \
		dpkg -i datamash_1.0.6-2_amd64.deb && \
		rm datamash_1.0.6-2_amd64.deb

# install bash-it
ADD bash-it-activation.sh /root/bash-it-activation.sh

ENV BASH_IT_PLUGINS "base git ssh subversion xterm"
ENV BASH_IT_ALIASES "general git svn vim"
ENV BASH_IT_COMPLETIONS "bash-it defaults git pip ssh svn"

RUN mkdir ~/.bash_it \
		&& curl -fsSL https://github.com/Bash-it/bash-it/archive/master.tar.gz | tar xzf - --strip-components=1 -C ~/.bash_it \
  	&& 	~/.bash_it/install.sh --none \
	  && sed -i 's/bobby/pure/' ~/.bashrc \
		&& /root/bash-it-activation.sh

RUN sed -i 's/^. -z .*PS1.*//' /etc/bash.bashrc

WORKDIR "/app"

VOLUME ["/app"]

CMD ["/bin/bash"]
