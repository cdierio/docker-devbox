# docker-devbox
base docker image for local software development

# tl;dr
## build
``` bash
$ docker build -t pgrund/devbox github.com:pgrund/docker-devbox.git
```
## simple usage
``` bash
$ docker run -it -v $(pwd):/home/dev/app pgrund/devbox
```

# advanced usage

## content
 - [subversion](http://subversion.apache.org/)
 - [git](https://git-scm.com/)
 - [python](http://www.python.org), [pip](https://pip.pypa.io/), [pygments](http://pygments.org)
 - [xmlstarlet](http://xmlstar.sourceforge.net/)
 - [jq](http://stedolan.github.io/jq/)
 - [csvkit](https://csvkit.readthedocs.org)
 - [datamash](http://www.gnu.org/software/datamash/)
 - [nvm](https://github.com/creationix/nvm)
 - [bash-it](https://github.com/Bash-it/bash-it)
 - [jdk](http://www.oracle.com/technetwork/java) 7 and 8 , [jenv](https://github.com/gcuisinier/jenv)
 - [maven](http://maven-apache.org)

## volumes
This image provides the following volumes to handle data

### /home/dev/app
Actual working data folder, this folder is the default working directory and is usually used to mount a file shared

### /home/dev/.m2/repository
Originates from maven, if you want to reuse an existing local maven repository

### /home/dev/.m2/repository/setings.xml
Originates from maven, if you want to use special settings.

## tipps
It has come in handy to use local bash alias ...

``` alias mvn='docker run -it -v $HOME/.m2/repository:/home/dev/.m2/repository -v $(pwd):/home/dev/app pgrund/devbox mvn $1' ```
