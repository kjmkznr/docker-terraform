FROM alpine
LABEL maintainer="KOJIMA Kazunori kjm.kznr@gmail.com"

RUN apk --no-cache --update add git bash openssh-client ca-certificates curl

ENV TERRAFORM_VERSION=1.3.2
RUN curl -LOs https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
 && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin/ \
 && rm -rf terraform_${TERRAFORM_VERSION}_linux_amd64.zip

CMD ["/usr/bin/terraform"]
