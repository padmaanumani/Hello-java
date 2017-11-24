FROM java:8-jdk

MAINTAINER JeyanthiBalakrishnan

# Install dependencies
RUN apt-get update

ENV TOMCAT_VERSION 8.0.47

# Get Tomcat
RUN wget --quiet --no-cookies http://apache.rediris.es/tomcat/tomcat-8/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz -O /tmp/tomcat.tgz 
RUN tar xzvf /tmp/tomcat.tgz -C /opt
RUN mv /opt/apache-tomcat-${TOMCAT_VERSION} /opt/tomcat
#Remove additional folders which are not required
RUN rm /tmp/tomcat.tgz
RUN rm -rf /opt/tomcat/webapps/examples
RUN rm -rf /opt/tomcat/webapps/docs
RUN rm -rf /opt/tomcat/webapps/ROOT

ENV CATALINA_HOME /opt/tomcat
ENV PATH $PATH:$CATALINA_HOME/bin

#EXPOSE 9090
#EXPOSE 9191

VOLUME "/opt/tomcat/webapps"
WORKDIR /opt/tomcat

#Deploy war
COPY $WORKSPACE/target/*.war /opt/tomcat/webapps/

# Launch Tomcat
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
