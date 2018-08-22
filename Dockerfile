FROM fabric8/java-centos-openjdk8-jdk:1.5.1

ENV PATH "${PATH}:/opt/apache-maven/bin"

USER root

RUN curl --silent --location https://rpm.nodesource.com/setup_8.x | bash - \
	&& yum -y install nodejs git \
	&& npm install -g bower \
	&& npm install -g gulp

WORKDIR /tmp

RUN curl -LO http://www-us.apache.org/dist/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.tar.gz \
	&& tar -zxvf apache-maven-3.5.4-bin.tar.gz \
	&& mv apache-maven-3.5.4 /opt \
	&& chown -R root:root /opt/apache-maven-3.5.4 \
	&& ln -s /opt/apache-maven-3.5.4 /opt/apache-maven

USER 1000

WORKDIR /src
