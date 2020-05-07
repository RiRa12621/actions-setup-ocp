FROM ubuntu:20.04

RUN apt-get update && \
      apt-get upgrade -y && \
      apt-get install -y wget &&\
      apt-get auto-clean -y

WORKDIR /cloud

RUN wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-install-linux.tar.gz && \
      tar -xzvf openshit-install-linux.tar -C . && \
      rm openshift-install-linux.tar.gz

COPY entrypoint.sh ./entrypoint.sh

ENTRYPOINT ["/cloud/entrypoint.sh"]
