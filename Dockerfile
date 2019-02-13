FROM openjdk:13-ea-7-jdk-nanoserver-sac2016

ENV FLYWAY_VERSION 5.2.4
WORKDIR /flyway-${FLYWAY_VERSION}


ADD https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/${FLYWAY_VERSION}/flyway-commandline-${FLYWAY_VERSION}-windows-x64.zip /flyway_arch/flyway.zip

RUN powershell -Command Expand-Archive "c:\flyway_arch\flyway.zip" -DestinationPath c:/


ENTRYPOINT ["flyway.cmd"]
CMD ["--help"]