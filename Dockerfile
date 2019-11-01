FROM groovy:2.4

USER root

ENV CODENARC_VERSION=1.4
ENV SLF4J_VERSION=1.7.29
ENV GMETRICS_VERSION=1.0

RUN wget https://netcologne.dl.sourceforge.net/project/codenarc/codenarc/CodeNarc%20$CODENARC_VERSION/CodeNarc-$CODENARC_VERSION.jar \
    -P /opt/CodeNarc-$CODENARC_VERSION
RUN wget http://repo2.maven.org/maven2/org/slf4j/slf4j-api/$SLF4J_VERSION/slf4j-api-$SLF4J_VERSION.jar \
    -P /opt/slf4j-$SLF4J_VERSION
RUN wget http://repo2.maven.org/maven2/org/slf4j/slf4j-simple/$SLF4J_VERSION/slf4j-simple-$SLF4J_VERSION.jar \
    -P /opt/slf4j-$SLF4J_VERSION
RUN wget https://github.com/dx42/gmetrics/releases/download/v$GMETRICS_VERSION/GMetrics-$GMETRICS_VERSION.jar \
    -P /opt/GMetrics-$GMETRICS_VERSION

COPY codenarc /usr/bin

USER groovy

WORKDIR /ws

ENTRYPOINT ["codenarc"]
