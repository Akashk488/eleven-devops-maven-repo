FROM ubuntu
WORKDIR /opt
RUN useradd akash && apt update && apt install git -y && apt install default-jre -y && apt install maven -y && git clone https://github.com/ElevenDevOps/elevenDevOps_ProjectCode.git && cd elevenDevOps_ProjectCode && mvn clean package
USER akash

FROM tomee
COPY --from=0 /opt/elevenDevOps_ProjectCode/target/maven-web-application.war /usr/local/tomee/webapps
EXPOSE 8080
