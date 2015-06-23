FROM pgrund/devbox
MAINTAINER Peter Grund, peter.grund@bisnode.de

# Install Java.
RUN apt-get update && apt-get install -y software-properties-common python-software-properties && \
  add-apt-repository -y ppa:webupd8team/java -y && \
  echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \ 
  apt-get update && \
  apt-get install -y oracle-java7-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk7-installer

#http://mirror.arcor-online.net/www.apache.org/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz
# Install and setup Maven
ADD ./apache-maven-3.3.3-bin.tar.gz /usr/local/apache-maven/
ADD ./settings.xml /usr/local/apache-maven/apache-maven-3.3.3/conf/settings.xml
# Install bash completion
ADD ./bash_completion-mvn /etc/bash_completion.d/mvn	

# Define commonly used variable
ENV JAVA_HOME /usr/lib/jvm/java-7-oracle
ENV MAVEN_HOME /usr/local/apache-maven/apache-maven-3.3.3
ENV PATH $PATH:$MAVEN_HOME/bin:$JAVA_HOME/bin

RUN echo $PATH

USER dev

VOLUME ["/home/dev/.m2/repository"]

CMD ["/bin/bash"]