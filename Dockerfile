FROM     ubuntu:16.04
MAINTAINER mateus [dot] m [dot] luna [at] gmail [dot] com

ENV DEBIAN_FRONTEND=noninteractive \
    ANDROID_HOME=/opt/android-sdk-linux \
    NODE_VERSION=8.4.0 \
	CORDOVA_ANDROID_VERSION=latest
    # NPM_VERSION=@4.0.5 \
    # IONIC_VERSION=@3.5.0 \
    # CORDOVA_VERSION=@7.0.1\

# Install basics
RUN apt-get update &&  \
    apt-get install -y sudo git wget curl unzip ruby && \

    curl --retry 3 -SLO "http://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz" && \
    tar -xzf "node-v$NODE_VERSION-linux-x64.tar.gz" -C /usr/local --strip-components=1 && \
    rm "node-v$NODE_VERSION-linux-x64.tar.gz" && \
    npm install -g npm"$NPM_VERSION" && \
    npm install -g cordova"$CORDOVA_VERSION" ionic"$IONIC_VERSION" cordova-android@latest && \
    # npm cache clear  && \


#ANDROID
#JAVA

# install python-software-properties (so you can do add-apt-repository)
    apt-get update && apt-get install -y -q python-software-properties software-properties-common  && \

    add-apt-repository ppa:webupd8team/java -y && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get update && apt-get -y install oracle-java8-installer && \

#ANDROID

# Install Gradle
	add-apt-repository ppa:cwchien/gradle -y && \
	apt-get update  && \
	apt-get install gradle -y && \

    echo ANDROID_HOME="${ANDROID_HOME}" >> /etc/environment && \
    dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y --force-yes expect ant wget libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5 lib32z1 qemu-kvm kmod && \
    apt-get clean && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \

# Install Android SDK
    cd /opt && \
    wget --output-document=android-sdk.tgz --quiet http://dl.google.com/android/android-sdk_r24.4.1-linux.tgz && \
    tar xzf android-sdk.tgz && \
    rm -f android-sdk.tgz && \
    chown -R root. /opt

# Setup environment
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:/opt/tools

# Install sdk elements
COPY tools /opt/tools

RUN ["/opt/tools/android-accept-licenses.sh", "android update sdk --all --no-ui --filter platform-tools,tools,build-tools-25.0.0,android-25,extra-android-support,extra-android-m2repository,extra-google-m2repository"]

# RUN unzip ${ANDROID_HOME}/temp/*.zip -d ${ANDROID_HOME}

EXPOSE 8100 35729

ADD tools/ionic.sh /root/ionic.sh
####

# ADD init-user.sh /init-user.sh
# RUN chmod a+x /init-user.sh

# ENTRYPOINT ["/init-user.sh"]


# CMD ["ionic", "serve"]
