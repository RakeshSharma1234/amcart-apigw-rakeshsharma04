FROM openjdk:11
VOLUME /tmp
EXPOSE 8082
COPY opentelemetry-javaagent.jar   /usr/src/apm/agent.jar
ARG JAR_FILE=target/APIGateway-0.0.1-SNAPSHOT.jar
ADD ${JAR_FILE} app.jar
ENTRYPOINT ["java","-javaagent:/usr/src/apm/agent.jar","-Dotel.exporter.otlp.endpoint=http://amcart-signoz-otel-collector.amcart-platform.svc.cluster.local:4317","-Dotel.resource.attributes=service.name=APIGateway","-jar","/app.jar"]