FROM anapsix/alpine-java:8_server-jre_unlimited

MAINTAINER Lion Li

RUN apt-get update && apt-get install -y maven

RUN mvn clean install -Dmaven.test.skip=true

RUN mkdir -p /ruoyi/nacos

WORKDIR /ruoyi/nacos

EXPOSE 8848

ENV TZ=Asia/Shanghai JAVA_OPTS="-Xms256m -Xmx512m"

ADD ./target/ruoyi-nacos.jar ./app.jar

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "app.jar", "${JAVA_OPTS}"]

