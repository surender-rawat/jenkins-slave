FROM jenkinsci/jnlp-slave
MAINTAINER Surender S  Rawat <ssrawat.nitj@gmail.com>

ARG VCS_REF
ARG BUILD_DATE

# Metadata
LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/surender-rawat/jenkins-slave" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.docker.dockerfile="/Dockerfile"

USER root

# Note: Latest version of kubectl may be found at:
# https://aur.archlinux.org/packages/kubectl-bin/
ENV KUBE_LATEST_VERSION="v1.18.0"
# Note: Latest version of helm may be found at:
# https://github.com/kubernetes/helm/releases
ENV HELM_VERSION="v3.3.0"
# Note: Latest version of docker may be found at:
# https://get.docker.com/builds
ENV DOCKER_VERSION="18.09.0"

RUN apt-get update && apt-get install -y --no-install-recommends \
    # Install Kubectl
    && curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl \
    # Install Helm 
    && curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 \
    && chmod 700 get_helm.sh \
    && ./get_helm.sh \
    # Install Docker
    && curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-$DOCKER_VERSION.tgz \
    && tar --strip-components=1 -xvzf docker-$DOCKER_VERSION-ce.tgz -C /usr/local/bin \
    && chmod a+x /usr/local/bin/dockerd \
    # Cleanup uncessary files
    && apt-get clean \
    && rm -rf /tmp/* ~/*.tgz
    
# installing java

# Install OpenJDK-8
RUN apt-get update && \
apt-get install -y --no-install-recommends \
        openjdk-11-jre
        
CMD ["java","-version"]

#install GIT
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git
    
  


