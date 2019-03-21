FROM alpine:3.9.2
RUN apk add --no-cache build-base
COPY h.c h.c
RUN gcc -static h.c -oh
RUN strip h
FROM scratch
COPY --from=0 h h
ENTRYPOINT ["/h"]
