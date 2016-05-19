FROM alpine:latest
RUN	apk update && apk upgrade && \
	apk add wrk --update-cache --repository http://dl-8.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

ENTRYPOINT ["wrk"]