FROM ubuntu
RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN sudo apt-get install -y wget
RUN wget https://mirrors.estointernet.in/apache/tomcat/tomcat-8/v8.5.70/bin/apache-tomcat-8.5.70.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-8.5.70/* /opt/tomcat/.
RUN yum -y install java
RUN java -version

WORKDIR /opt/tomcat/webapps
COPY webapp/target/webapp.war /opt/tomcat/webapps
EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
