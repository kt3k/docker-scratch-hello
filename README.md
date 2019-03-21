# docker-scratch-hello

[![Build Status](https://travis-ci.org/kt3k/docker-scratch-hello.svg?branch=master)](https://travis-ci.org/kt3k/docker-scratch-hello)

> Say hello from scratch container

The result container size is 14.2kB.

```console
$ docker build . -t hello
Sending build context to Docker daemon  55.81kB
Step 1/8 : FROM alpine:3.9.2
 ---> 5cb3aa00f899
Step 2/8 : RUN apk add --no-cache build-base
 ---> Using cache
 ---> e04115ba92d9
Step 3/8 : COPY h.c h.c
 ---> Using cache
 ---> c9ea26775f2b
Step 4/8 : RUN gcc -static h.c -oh
 ---> Using cache
 ---> 9203df86f8b0
Step 5/8 : RUN strip h
 ---> Using cache
 ---> 526c3fde0d49
Step 6/8 : FROM scratch
 --->
Step 7/8 : COPY --from=0 h h
 ---> Using cache
 ---> 5647671e9127
Step 8/8 : ENTRYPOINT ["/h"]
 ---> Using cache
 ---> 77a6c47838b6
Successfully built 77a6c47838b6
Successfully tagged hello:latest
$ docker run hello
hello
$ docker inspect hello | jq .[0].Size
14160
# => 14.2kB
```

# License

MIT
