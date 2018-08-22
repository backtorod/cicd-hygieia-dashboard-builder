# cicd-hygieia-dashboard-builder

## requirements

* docker
* docker-compose
* hygieia-builder (centos)

## build image builder

```shell
docker build -t wearecloud44/hygieia-builder:centos -f Dockerfile .
```

## build hygieia artifacts and docker images

```shell
docker run -it -v /home/rguareschi/git/Hygieia:/src wearecloud44/hygieia-builder:centos mvn clean install package
docker-compose build
```

## start stack

```
docker-compose up -d
