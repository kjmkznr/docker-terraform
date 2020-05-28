FROM alpine
LABEL maintainer="KOJIMA Kazunori kjm.kznr@gmail.com"

RUN apk --no-cache --update add git bash bzr git mercurial subversion openssh-client ca-certificates curl

ENV TERRAFORM_VERSION=0.12.26
RUN curl -LOs https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
 && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin/ \
 && rm -rf terraform_${TERRAFORM_VERSION}_linux_amd64.zip

CMD ["/usr/bin/terraform"]
