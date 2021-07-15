FROM ubuntu
#FROM tomcat:8.0-alpine
# set maintainer
LABEL maintainer "jobsjeffnego@gmail.com"


RUN apt-get update
RUN apt install -y apt-utils
RUN apt install -y openjdk-11-jdk
RUN apt install -y maven
RUN apt install -y git
RUN apt install -y vim
RUN useradd jenkins
RUN mkdir /home/jenkins
RUN chown jenkins:jenkins /home/jenkins
RUN cd /home/jenkins; git clone https://github.com/jefffall/stageTomcat
RUN chown -R jenkins:jenkins /home/jenkins
RUN chmod +x /home/jenkins/stageTomcat/target/bin/webapp
EXPOSE 8080
