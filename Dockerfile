FROM openjdk:13-ea-7-jdk-nanoserver-sac2016

ENV FLYWAY_VERSION 5.2.4

ADD https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/${FLYWAY_VERSION}/flyway-commandline-${FLYWAY_VERSION}-windows-x64.zip /flyway_arch/flyway.zip

RUN powershell -Command Expand-Archive "c:\flyway_arch\flyway.zip" -DestinationPath c:/

RUN powershell -Command Remove-Item -LiteralPath "c:\flyway_arch" -Force -Recurse

RUN powershell -Command Rename-Item -Path "c:\flyway-$Env:FLYWAY_VERSION" -NewName "flyway" -force


WORKDIR /flyway
ENTRYPOINT ["flyway.cmd"]
CMD ["--help"]