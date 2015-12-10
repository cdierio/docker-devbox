FROM pgrund/devbox:base
MAINTAINER Peter Grund, peter.grund@bisnode.de

# install java
RUN add-apt-repository -y ppa:webupd8team/java -y  && \
		echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
		apt-get update && \
		apt-get install -y oracle-java8-installer oracle-java7-installer oracle-java6-installer && \
		apt-get clean; \
		rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/oracle-jdk8-installer /var/cache/oracle-jdk7-installer /var/cache/oracle-jdk6-installer

# Define commonly used variable
ENV JAVA_VERSION 1.8

# install jenv
RUN mkdir ~/.jenv && curl -fsSL https://github.com/gcuisinier/jenv/archive/master.tar.gz | tar xzf - --strip-components=1 -C ~/.jenv \
		&& export PATH=$PATH:/root/.jenv/bin \
		&& echo 'eval "$(jenv init -)"' >> ~/.bash_it/custom/jenv.bash && eval "$(jenv init -)" \
		&& jenv add /usr/lib/jvm/java-6-oracle \
 		&& jenv add /usr/lib/jvm/java-7-oracle \
 		&& jenv add /usr/lib/jvm/java-8-oracle \
		&& jenv rehash \
		&& jenv global $JAVA_VERSION

ENV PATH /root/.jenv/bin:$PATH

# Install and setup Maven
ENV MAVEN_VERSION 3.3.3
RUN mkdir /usr/local/apache-maven \
		&& curl -fsSL http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xzf - -C /usr/local/apache-maven \
		&& eval "$(jenv init -)" && jenv enable-plugin maven
ENV MAVEN_2_VERSION 2.2.1
RUN curl -fsSL http://archive.apache.org/dist/maven/maven-2/${MAVEN_2_VERSION}/binaries/apache-maven-${MAVEN_2_VERSION}-bin.tar.gz | tar xzf - -C /usr/local/apache-maven \
		&& echo "alias mvn2=/usr/local/apache-maven/apache-maven-${MAVEN_2_VERSION}/bin/mvn" > /root/.bash_it/aliases/custom.aliases.bash

RUN mkdir /root/.m2 && touch /root/.m2/settings.xml

# update bash-it plugins, completions, aliases ..
ENV BASH_IT_PLUGINS "java"
ENV BASH_IT_ALIASES "maven"
ENV BASH_IT_COMPLETIONS "maven"

RUN /root/bash-it-activation.sh

ENV MAVEN_HOME /usr/local/apache-maven/apache-maven-$MAVEN_VERSION
ENV PATH /root/.jenv/shims:$MAVEN_HOME/bin:$PATH

VOLUME [ "/root/.m2/repository" ]
