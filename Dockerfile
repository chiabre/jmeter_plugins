# inspired by https://github.com/hauptmedia/docker-jmeter  and
# https://github.com/hhcordero/docker-jmeter-server/ and
# https://github.com/justb4/docker-jmeter and
# https://github.com/egaillardon/jmeter and
# https://github.com/egaillardon/jmeter-plugins

FROM alpine:3.19.1

LABEL maintainer="luca.chiabrera@gmail.com"

ARG JMETER_VERSION="5.6.3"
ARG OPENJDK_VERSION="17"

ARG JMETER_PLUGINS_MANAGER_VERSION="1.10"
ARG CMDRUNNER_VERSION="2.3"

ENV JMETER_LOG_LEVEL="INFO"

ENV MIRROR https://dlcdn.apache.org//jmeter/binaries
ENV JMETER_HOME /opt/apache-jmeter-${JMETER_VERSION}
ENV JMETER_BIN ${JMETER_HOME}/bin
ENV JMETER_LIB ${JMETER_HOME}/lib

RUN apk update \
 && apk upgrade \
 && apk add ca-certificates \
 && update-ca-certificates \
 && apk add --no-cache \
    curl \
    tzdata \
    bash \
 && apk --update add openjdk${OPENJDK_VERSION}-jre \
 && rm -rf /var/cache/apk/* 

RUN cd /tmp/ \
 && curl --location --silent --show-error --output apache-jmeter-${JMETER_VERSION}.tgz ${MIRROR}/apache-jmeter-${JMETER_VERSION}.tgz \
 && curl --location --silent --show-error --output apache-jmeter-${JMETER_VERSION}.tgz.sha512 https://www.apache.org/dist/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz.sha512 \
 && sha512sum -c apache-jmeter-${JMETER_VERSION}.tgz.sha512 \
 && mkdir -p /opt \
 && tar -xzf apache-jmeter-${JMETER_VERSION}.tgz -C /opt  \
 && rm -rf /tmp/* 


 RUN curl --location --silent --show-error --output ${JMETER_LIB}/ext/jmeter-plugins-manager-${JMETER_PLUGINS_MANAGER_VERSION}.jar http://search.maven.org/remotecontent?filepath=kg/apc/jmeter-plugins-manager/${JMETER_PLUGINS_MANAGER_VERSION}/jmeter-plugins-manager-${JMETER_PLUGINS_MANAGER_VERSION}.jar \ 
 && curl --location --silent --show-error --output ${JMETER_LIB}/cmdrunner-${CMDRUNNER_VERSION}.jar http://search.maven.org/remotecontent?filepath=kg/apc/cmdrunner/${CMDRUNNER_VERSION}/cmdrunner-${CMDRUNNER_VERSION}.jar \
 && java -cp ${JMETER_LIB}/ext/jmeter-plugins-manager-${JMETER_PLUGINS_MANAGER_VERSION}.jar org.jmeterplugins.repository.PluginManagerCMDInstaller \
 && chmod +x ${JMETER_BIN}/*.sh \
 && ${JMETER_BIN}/PluginsManagerCMD.sh install \
jpgc-casutg,\
# jpgc-graphs-basic,\
jpgc-perfmon,\
jpgc-dummy,\
jpgc-tst,\
jpgc-functions,\
jpgc-ffw,\
jpgc-fifo,\
# jpgc-graphs-additional,\
# jpgc-graphs-composite,\
# jpgc-synthesis,\
# jpgc-cmd,\
# jpgc-graphs-vs,\
# jpgc-mergeresults,\
# jpgc-filterresults,\
bzm-random-csv,\
jpgc-wsc,\
jpgc-csl,\
# jpgc-graphs-dist,\
# jpgc-json,\
jpgc-prmctl,\
bzm-parallel,\
jpgc-sense,\
jpgc-csvars,\
# jpgc-ggl,\
jpgc-xml,\
jpgc-httpraw,\
jpgc-autostop,\
jmeter-prometheus \
 && ${JMETER_BIN}/jmeter --version \
 && ${JMETER_BIN}/PluginsManagerCMD.sh status

ENV PATH $PATH:$JMETER_BIN

WORKDIR	/tmp

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 9270
EXPOSE 4445
