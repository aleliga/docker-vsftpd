# debian-based container for vsftpd
# VERSION               0.1
FROM debian

MAINTAINER Alessio Ligabue  "info@alessioligabue.it"
# thank you to Davide Lucchesi  "davide@lucchesi.nl"

RUN apt-get update && apt-get install -y --no-install-recommends vsftpd
RUN apt-get clean

#Davide Lucchesi
RUN echo "local_enable=YES" >> /etc/vsftpd.conf
RUN echo "chroot_local_user=YES" >> /etc/vsftpd.conf
RUN echo "write_enable=YES" >> /etc/vsftpd.conf
RUN echo "local_umask=022" >> /etc/vsftpd.conf
RUN sed -i "s/anonymous_enable=YES/anonymous_enable=NO/" /etc/vsftpd.conf

# Alessio
RUN sed -i "s/listen=NO/listen=YES/" /etc/vsftpd.conf
RUN echo "guest_enable=YES" >> /etc/vsftpd.conf
RUN echo "guest_username=virtual" >> /etc/vsftpd.conf
RUN echo "virtual_use_local_privs=YES" >> /etc/vsftpd.conf
RUN echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf
#RUN echo "listen_ipv6=YES" >> /etc/vsftpd.conf

# crea link simbolici x il database degli user
RUN ln -s /etc/vsftpd_login.db /etc/vsftpd/vsftpd_login.db

# aggiunge gruppo ftp e user virtual e cambia owner a dir dati
RUN groupadd -r ftp && useradd -r -g ftp virtual
RUN chown virtual.ftp /home/ftp/

RUN mkdir -p /var/run/vsftpd/empty

VOLUME /etc

EXPOSE 21

CMD /usr/sbin/vsftpd
