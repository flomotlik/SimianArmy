FROM java:openjdk-8-jdk

ENV GRADLE_VERSION 2.3

RUN wget -q https://services.gradle.org/distributions/gradle-$GRADLE_VERSION-all.zip \
  && unzip -q gradle-$GRADLE_VERSION-all.zip -d /usr/share/ \
  && rm gradle-$GRADLE_VERSION-all.zip \
  && mv /usr/share/gradle-$GRADLE_VERSION /usr/share/gradle \
  && ln -s /usr/share/gradle/bin/gradle /usr/bin/gradle


RUN mkdir -p /app
WORKDIR /app

COPY build.gradle /app/
COPY settings.gradle /app/
COPY gradle.properties /app/
copy gradle /app/

ADD . /app

RUN gradle assemble
