# docker-devbox-fe
docker image for frontend development

## build
``` bash
$ docker build -t pgrund/devbox github.com:pgrund/docker-devbox-fe.git
``` 
## usage
``` bash
$ docker run -it -p 9000:9000 -v $(pwd):/app pgrund/devbox /bin/bash
```
