FROM java:jdk-alpine

MAINTAINER Tanzim Saqib <me@tanzimsaqib.com>

ADD pom.xml /opt/springbootdemo/
ADD *.java /opt/springbootdemo/src/main/java/hello/

RUN	apk update && apk upgrade && \
	apk add maven --update-cache --repository http://dl-8.alpinelinux.org/alpine/edge/testing/ --allow-untrusted && \
    cd /opt/springbootdemo && \
    mvn package && \
    cd / && rm -rf /opt/springbootdemo  

EXPOSE 8080
