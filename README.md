# docker-devbox
base docker image for local software development

## build
``` bash
$ docker build -t pgrund/devbox github.com:pgrund/docker-devbox.git
```
## usage
``` bash
$ docker run -it -v $(pwd):/home/dev/app pgrund/devbox
```

# content
 - [subversion](http://subversion.apache.org/)
 - [git](https://git-scm.com/)
 - [python](http://www.python.org), [pip](https://pip.pypa.io/), [pygments](http://pygments.org)
 - [xmlstarlet](http://xmlstar.sourceforge.net/)
 - [jq](http://stedolan.github.io/jq/)
 - [csvkit](https://csvkit.readthedocs.org)
 - [datamash](http://www.gnu.org/software/datamash/)
 - [nvm](https://github.com/creationix/nvm)
 - [bash-it](https://github.com/Bash-it/bash-it)
 - [jdk](http://www.oracle.com/technetwork/java) 7 und 8 , [jenv](https://github.com/gcuisinier/jenv)
