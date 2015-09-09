# Debian 8 Jessie Backports
# OpenJDK 8
# Maven 3.3.3
# git


# extend the most recent long term support Ubuntu version
FROM debian:jessie-backports


# this is a non-interactive automated build - avoid some warning messages
ENV DEBIAN_FRONTEND noninteractive


RUN apt-get update
RUN apt-get install -y nano wget git openjdk-8-jdk

# remove download archive files
RUN apt-get clean

# Install maven 3.3.3
RUN wget http://apache.cs.utah.edu/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz
RUN tar xvzf apache-maven-3.3.3-bin.tar.gz
RUN mv apache-maven-3.3.3 /opt/mvn
RUN ln -s /opt/mvn/bin/mvn /usr/bin/mvn
RUN rm -f apache-maven-3.3.3-bin.tar.gz


# copy jenkins war file to the container
# ADD http://mirrors.jenkins-ci.org/war/1.574/jenkins.war /opt/jenkins.war
# RUN chmod 644 /opt/jenkins.war
# ENV JENKINS_HOME /jenkins

# configure the container to run jenkins, mapping container port 8080 to that host port
# ENTRYPOINT ["java", "-jar", "/opt/jenkins.war"]
EXPOSE 8080

#ENTRYPOINT ["/bin/sh"]

CMD ["/bin/bash"]


