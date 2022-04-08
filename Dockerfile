ARG IMAGE=intersystemsdc/iris-community:preview
FROM $IMAGE

USER root   
        
WORKDIR /opt/irisapp
RUN chown ${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} /opt/irisapp
RUN \
  apt-get update && \
  apt-get -y install nano

RUN apt install python3 -y

# Make python available in cmd
RUN export PATH=${PATH}:/usr/bin/python3
RUN /bin/bash -c "source ~/.bashrc"


USER ${ISC_PACKAGE_MGRUSER}

#COPY  Installer.cls .
COPY  in in
COPY  py py
COPY  src src
COPY module.xml module.xml
COPY iris.script /tmp/iris.script

RUN iris start IRIS \
	&& iris session IRIS < /tmp/iris.script \
    && iris stop IRIS quietly
