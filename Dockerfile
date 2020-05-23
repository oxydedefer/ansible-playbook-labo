
FROM alpine:3.11
RUN  apk --update add sudo                                         && \
    apk --update add bash                                         && \
	apk --update add make                                         && \
    apk --update add python py-pip openssl ca-certificates    && \
    apk --update add --virtual build-dependencies \
                python-dev libffi-dev openssl-dev build-base bash && \
    pip install --upgrade pip cffi                            && \
    apk --update add sshpass openssh-client rsync krb5 krb5-dev && \
    pip install ansible==2.8.5         && \
    pip install pywinrm xmltodict kerberos requests_kerberos && \
    apk del build-dependencies            && \
    rm -rf /var/cache/apk/*

#RUN rm /etc/krb5.conf
#COPY krb5.conf /etc/krb5.conf
RUN  touch /tmp/.vault_pwd
ENV ANSIBLE_HOST_KEY_CHECKING=False
RUN mkdir /home/.ssh
WORKDIR /app
ENTRYPOINT []
