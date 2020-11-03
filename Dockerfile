

FROM alpine:3.12
RUN apk add --no-cache --virtual build-dependencies python3-dev libffi-dev openssl-dev g++ python3-dev && \
    apk add --no-cache openssl ca-certificates sshpass openssh-client rsync krb5 krb5-dev libxslt-dev libxml2 samba bash&& \
    apk add --no-cache --update python3 py3-pip  git && \
    pip3 install --upgrade pip && \
    pip3 install cffi suds-py3  lxml cffi ansible==2.8.5 pywinrm xmltodict kerberos requests_kerberos mitogen gssapi pypsrp&& \
    apk del build-dependencies  && rm -rf  var/cache/apk/* && rm /etc/krb5.conf && \
    mkdir -p /etc/ansible

COPY ansible.cfg /etc/ansible/ansible.cfg
COPY krb5.conf /etc/krb5.conf
RUN  touch /tmp/.vault_pwd
ENV ANSIBLE_HOST_KEY_CHECKING=False
RUN mkdir /home/.ssh
WORKDIR /app
ENTRYPOINT []
