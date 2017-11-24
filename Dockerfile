FROM java:8-jdk

MAINTAINER JeyanthiBalakrishnan


# Get Tomcat
RUN wget --quiet --no-cookies http://apache.rediris.es/tomcat/tomcat-8/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz -O /tmp/tomcat.tgz && \
tar xzvf /tmp/tomcat.tgz -C /opt && \
mv /opt/apache-tomcat-${TOMCAT_VERSION} /opt/tomcat && \
rm /tmp/tomcat.tgz && \
rm -rf /opt/tomcat/webapps/examples && \
rm -rf /opt/tomcat/webapps/docs && \
rm -rf /opt/tomcat/webapps/ROOT

# Add admin/admin user
ADD tomcat-users.xml /opt/tomcat/conf/

ENV CATALINA_HOME /opt/tomcat
ENV PATH $PATH:$CATALINA_HOME/bin

EXPOSE 9090
EXPOSE 9009
VOLUME "/opt/tomcat/webapps"
WORKDIR /opt/tomcat

#Deploy war
COPY $WORKSPACE/target/*.war /opt/tomcat/webapps/

# Launch Tomcat
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
