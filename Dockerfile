FROM ubuntu:latest

# Followed guide: https://www.digitalocean.com/community/tutorials/how-to-acquire-a-let-s-encrypt-certificate-using-dns-validation-with-acme-dns-certbot-on-ubuntu-18-04
# Script originally from: https://github.com/joohoi/acme-dns-certbot-joohoi
COPY ./acme-dns-auth.py /scripts/acme-dns-auth.py
RUN apt-get update && \
apt-get install -y software-properties-common && \
apt-add-repository ppa:certbot/certbot && \
apt-get install -y certbot && \
rm -rf /var/lib/apt/lists/* && \
chmod +x /scripts/acme-dns-auth.py