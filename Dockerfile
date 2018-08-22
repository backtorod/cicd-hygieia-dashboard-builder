FROM fabric8/java-centos-openjdk8-jdk:1.5.1

ENV PATH "${PATH}:/opt/apache-maven/bin" \
		MAVEN_ROOT "/opt/apache-maven" \
		MAVEN_VERSION "3.5.4" \
		BUILD_DEPS "nodejs git" \
		NPM_DEPS "bower gulp" \
		APP_ROOT "/src" \
		APP_UID 1000 \
		APP_GID 1000

USER root

WORKDIR /tmp

RUN curl --silent --location https://rpm.nodesource.com/setup_8.x | bash - \
	&& yum -y install "${BUILD_DEPS}" \
	&& npm install -g "${NPM_DEPS}" \
	&& curl -LO "http://www-us.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz" \
	&& tar -zxvf "apache-maven-${MAVEN_VERSION}-bin.tar.gz" \
	&& mv "apache-maven-${MAVEN_VERSION}" /opt \
	&& chown -R $APP_UID:$APP_GID "/opt/apache-maven-${MAVEN_VERSION}" \
	&& ln -s "/opt/apache-maven-${MAVEN_VERSION}" $MAVEN_ROOT

USER $APP_UID

WORKDIR $APP_ROOT
