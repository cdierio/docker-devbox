# docker-devbox
base docker image for software development

## build
``` bash
$ docker build -t pgrund/devbox github.com:pgrund/docker-devbox.git
``` 
## usage
``` bash
$ docker run -it -v $(pwd):/home/dev/app pgrund/devbox
```
