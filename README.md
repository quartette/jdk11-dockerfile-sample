## jdk11 dockerfile

* https://github.com/AdoptOpenJDK/openjdk-docker

### build
```
$ docker build --force-rm=true --compress=true -t quartette-jdk11:latest .
```

### test
```
$ docker run -p 8080:8080 -it quartette-jdk11:latest /bin/sh
```