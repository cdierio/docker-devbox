FROM ubuntu:14.04
MAINTAINER Peter Grund, peter.grund@bisnode.de

# create user 'dev', allow sudo
RUN useradd -d /home/dev -ms /bin/bash -k /root/ dev; \
	 echo "dev ALL=NOPASSWD:ALL" >> /etc/sudoers;

# using bash as default
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# install via apt-get and clean up
RUN  apt-get update && \
		 apt-get install -y software-properties-common python-software-properties unzip subversion git vim nano wget curl python-dev python-pip python-setuptools build-essential libssl-dev xmlstarlet jq;\
		 apt-get clean; \
 		 rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# install java
RUN add-apt-repository -y ppa:webupd8team/java -y  && \
		echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
		apt-get update && \
		apt-get install -y oracle-java8-installer oracle-java7-installer && \
		apt-get clean; \
		rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/oracle-jdk7-installer /var/cache/oracle-jdk8-installer

RUN yes | pip install csvkit pygments
RUN wget http://launchpadlibrarian.net/188304624/datamash_1.0.6-2_amd64.deb && \
	dpkg -i datamash_1.0.6-2_amd64.deb && \
	rm datamash_1.0.6-2_amd64.deb

# Install and setup Maven
RUN wget http://mirror.arcor-online.net/www.apache.org/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz && \
	    mkdir /usr/local/apache-maven ; tar xzvf apache-maven-3.3.3-bin.tar.gz -C /usr/local/apache-maven/ && \
	    rm apache-maven-3.3.3-bin.tar.gz

# Define commonly used variable
ENV JAVA_HOME /usr/lib/jvm/java-7-oracle
ENV MAVEN_HOME /usr/local/apache-maven/apache-maven-3.3.3
ENV PATH $PATH:$JAVA_HOME/bin:$MAVEN_HOME/bin:/root/.jenv/bin

# install latest nvm
RUN	curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash && \
		. ~/.nvm/nvm.sh && \
		nvm install stable && \
		nvm alias default stable && \
		echo ". ~/.nvm/nvm.sh" | tee -a ~/.profile ~/.bashrc

# install jenv
RUN wget https://github.com/gcuisinier/jenv/archive/master.tar.gz && \
		mkdir ~/.jenv && \
		tar xzvf master.tar.gz --strip-components=1 -C ~/.jenv && \
		rm master.tar.gz  && \
		echo 'eval "$(jenv init -)"' >> ~/.profile && eval "$(jenv init -)" && \
 		jenv add /usr/lib/jvm/java-7-oracle && \
 		jenv add /usr/lib/jvm/java-8-oracle && \
		jenv rehash && \
		jenv global 1.8

# install bash-it
RUN wget https://github.com/Bash-it/bash-it/archive/master.tar.gz && \
		mkdir ~/.bash_it && \
		tar xzvf master.tar.gz --strip-components=1 -C ~/.bash_it && \
 		~/.bash_it/install.sh --all && \
		sed -i 's/bobby/pure/' ~/.bashrc && \
		rm master.tar.gz

# Install nvm bash completion
ADD https://raw.githubusercontent.com/creationix/nvm/master/bash_completion /etc/bash_completion.d/nvm

WORKDIR "/home/dev/app"

VOLUME [ "/home/dev/app", "/home/dev/.m2/repository","/home/dev/.m2/repository/setings.xml"]

CMD ["/bin/bash"]
