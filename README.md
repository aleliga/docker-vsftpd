# docker-vsftpd
Creazione di un server vsftpd con docker

# non mantenuto

# Utenti
Gli utenti sono virtuali e mantenuti nel file vsftpd/vsftpd_login.db 
che sara montato come volume esterno
Questi come design vengono richiamati da link simbolici dal container in /etc/ a /docker/vsftpd/

/etc/vsftpd_login.db -> /etc/vsftpd/vsftpd_login.db
mount /docker/vsftpd/ /etc/vsftpd/

# Dati ftp
I dati dell'ftp sono disponibili in /docker/ftp-data/ che sarà montata come volume su /home/ftp

# Generazione immagine
docker run -p 21:21 -v /docker/ftp-data/:/home/ftp -v /docker/vsftpd/:/etc/vsftpd/
