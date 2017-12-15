FROM openjdk:8-jre-alpine
MAINTAINER GGK_DevOps

ARG jarfile_name
ARG port

ENV db_details=cicd_sample

VOLUME /tmp
VOLUME /logs
VOLUME /configs

ADD src/main/docker/wait-for-it.sh /wait-for-it.sh
ADD target/${jarfile_name} app.jar
ADD src/main/docker/run.sh .

RUN chmod +x wait-for-it.sh
RUN chmod +x run.sh

EXPOSE ${port}
ENTRYPOINT ["sh", "./run.sh" ]





