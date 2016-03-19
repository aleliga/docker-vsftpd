# debian-based container for vsftpd
# VERSION               0.1
FROM debian

MAINTAINER Alessio Ligabue  "info@alessioligabue.it"
# thank you to Davide Lucchesi  "davide@lucchesi.nl"


RUN apt-get update && apt-get install -y --no-install-recommends vsftpd
RUN apt-get clean

# Alessio
RUN sed -i "s/listen=NO/listen=YES/" /etc/vsftpd.conf
RUN echo "guest_enable=YES" >> /etc/vsftpd.conf
RUN echo "guest_username=virtual" >> /etc/vsftpd.conf
RUN echo "virtual_use_local_privs=YES" >> /etc/vsftpd.conf
RUN echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf
#RUN echo "listen_ipv6=YES" >> /etc/vsftpd.conf

#Davide Lucchesi
RUN echo "local_enable=YES" >> /etc/vsftpd.conf
RUN echo "chroot_local_user=YES" >> /etc/vsftpd.conf
RUN echo "write_enable=YES" >> /etc/vsftpd.conf
RUN echo "local_umask=022" >> /etc/vsftpd.conf
RUN sed -i "s/anonymous_enable=YES/anonymous_enable=NO/" /etc/vsftpd.conf

RUN mkdir -p /var/run/vsftpd/empty

VOLUME /etc

EXPOSE 21

CMD /usr/sbin/vsftpd
