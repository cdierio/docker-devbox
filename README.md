use development tools from container, modifying local sources ...

# tl;dr

``` bash
 docker run -it -v $(pwd):/app pgrund/devbox:<tag> <command>
```

# Supported tags and respective `Dockerfile` links
- [`base`,`latest`(*base/Dockerfile*)](https://github.com/pgrund/docker-devbox/tree/master/base/Dockerfile)
  - no special programming language, lot's of useful tools ...
- [`java`(*java/Dockerfile*)](https://github.com/pgrund/docker-devbox/tree/master/java/Dockerfile)
  - for java development (java6, java7, java8 via [jenv](https://github.com/gcuisinier/jenv); maven, ...)
- [`node`(*node/Dockerfile*)](https://github.com/pgrund/docker-devbox/tree/master/node/Dockerfile)
  - for node.js development (node, npm via [nvm](https://github.com/creationix/nvm); yeoman, bower, grunt, gulp .. )

## base
all others refer to this one as parent image

### content
- general (build-essentials, curl, wget, vim, ... )
- [subversion](https://subversion.apache.org/)
- [git](https://git-scm.com/)
- [python](https://www.python.org), [pip](https://pip.pypa.io/), [pygments](https://pygments.org)
- [xmlstarlet](https://xmlstar.sourceforge.net/)
- [jq](https://stedolan.github.io/jq/)
- [csvkit](https://csvkit.readthedocs.org)
- [datamash](https://www.gnu.org/software/datamash/)
- [graphviz](https://www.graphviz.org/)
- [bash-it](https://github.com/Bash-it/bash-it)

### volumes
project sources are supposed to be mounted under `/app`

### defaults
`/bin/bash` is run as default command

## java
[java](https://java.com/download) development providing multiple java versions in parallel via [jenv](https://github.com/gcuisinier/jenv)

### content
- [jdk6 (oracle)](https://www.oracle.com/technetwork/java/javase/downloads/index.html)
- [jdk7 (oracle)](https://www.oracle.com/technetwork/java/javase/downloads/index.html)
- [jdk8 (oracle)](https://www.oracle.com/technetwork/java/javase/downloads/index.html)
- [maven (v3.3.3)](https://maven.apache.org/download.html)
- [maven (v2.2.1)](https://maven.apache.org/download.html)

### volumes
a local maven repository can be mounted to `/root/.m2/repository` as well as a local maven configuration can be mounted to `/root.m2/settings.xml`

### examples
```bash
 docker run -it -v /path/to/local/repository:/root/.m2/repository -v /path/to/local/settings.xml:/root/.m2/settings.xml -v /path/to/local/maven/project:/app /pgrund/devbox:java mvn clean install
```

## node
frontend development based on [javascript](http://www.w3schools.com/js/)

### content
- [nodejs](https://nodejs.org/), [npm](https://www.npmjs.com/) via [nvm](https://github.com/creationix/nvm)
- [bower](https://bower.io/)
- [grunt](https://gruntjs.com/)
- [gulp](https://gulpjs.com/)
- [yeoman](https://yeoman.io/)
  - [generators](https://yeoman.io/generators/): angular, angular-fullstack, webapp, wordpress

# general tipps
It has come in handy to use local alias ...

```bash
$ alias mvn='docker run -it --rm -v $HOME/.m2/repository:/root/.m2/repository -v $HOME/.m2/settings.xml:/root/.m2/settings.xml -v $(pwd):/app pgrund/devbox mvn $*'
$ alias devbox='docker run -it --rm-v -v $HOME/.m2/settings.xml:/root/.m2/settings.xml -v $(pwd):/app pgrund/devbox /bin/bash' 
```
