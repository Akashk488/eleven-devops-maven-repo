FROM alpine
WORKDIR /opt
RUN apt update && apt install git -y && apt install default-jre -y && apt install maven -y && git clone https://github.com/Akashk488/eleven-devops-maven-repo.git && cd eleven-devops-maven-repo && mvn clean package

FROM tomee
COPY --from=0 /opt/eleven-devops-maven-repo/target/maven-web-application.war /usr/local/tomee/webapps
EXPOSE 8080
