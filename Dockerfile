FROM concourse/buildroot:base

ADD https://storage.googleapis.com/kubernetes-release/release/v1.11.2/bin/linux/amd64/kubectl /usr/local/bin/kubectl
RUN chmod +x /usr/local/bin/kubectl

ADD assets/ /opt/resource/
RUN chmod +x /opt/resource/*
