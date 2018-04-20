FROM frolvlad/alpine-oraclejdk8:slim
MAINTAINER Arthur Petukhovsky <petuhovskiy@yandex.ru>
VOLUME ["/tmp"]
ADD app.jar app.jar
RUN sh -c 'touch /app.jar'
EXPOSE 8080
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/app.jar"]
