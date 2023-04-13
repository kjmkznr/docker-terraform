# syntax=docker/dockerfile:1
FROM debian AS build
LABEL maintainer="KOJIMA Kazunori kjm.kznr@gmail.com"
ENV TERRAFORM_VERSION=1.4.5

RUN <<EOF bash
apt-get update 
apt-get install -y curl unzip
curl -LOs https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin/
EOF

FROM debian:stable-slim

RUN <<EOF bash
apt-get update 
apt-get install --no-install-recommends -y git openssh-client ca-certificates
apt-get clean
rm -rf /var/lib/apt/lists/*
EOF
COPY --from=build /usr/bin/terraform /usr/bin/terraform

CMD ["/usr/bin/terraform"]
