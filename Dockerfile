FROM maven:3

RUN mkdir -p /app
WORKDIR /app

RUN mkdir -p dev-tools plugins core rest-api-spec

ADD pom.xml /app/pom.xml
ADD core/pom.xml /app/core/pom.xml

ADD plugins/pom.xml /app/plugins/pom.xml

ADD plugins/analysis-smartcn/pom.xml  /app/plugins/analysis-smartcn/pom.xml
ADD plugins/analysis-stempel/pom.xml  /app/plugins/analysis-stempel/pom.xml
ADD plugins/analysis-phonetic/pom.xml  /app/plugins/analysis-phonetic/pom.xml
ADD plugins/analysis-icu/pom.xml  /app/plugins/analysis-icu/pom.xml
ADD plugins/analysis-kuromoji/pom.xml  /app/plugins/analysis-kuromoji/pom.xml
ADD plugins/cloud-gce/pom.xml  /app/plugins/cloud-gce/pom.xml
ADD plugins/cloud-azure/pom.xml  /app/plugins/cloud-azure/pom.xml
ADD plugins/cloud-aws/pom.xml  /app/plugins/cloud-aws/pom.xml
ADD plugins/lang-python/pom.xml  /app/plugins/lang-python/pom.xml
ADD plugins/lang-javascript/pom.xml  /app/plugins/lang-javascript/pom.xml
ADD plugins/delete-by-query/pom.xml  /app/plugins/delete-by-query/pom.xml

ADD dev-tools/pom.xml /app/dev-tools/pom.xml
ADD rest-api-spec/pom.xml /app/rest-api-spec/pom.xml

RUN mvn dependency:copy-dependencies

ADD . /app

RUN mvn install -DskipTests=true -B
