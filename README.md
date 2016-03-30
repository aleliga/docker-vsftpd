# docker-vsftpd
Creazione di un server vsftpd con docker

# Utenti
Gli utenti sono virtuali e mantenuti nel file vsftpd/vsftpd_login.db 
che sara montato come volume esterno
Questi come design vengono richiamati da link simbolici dal container in /etc a /docker/vsftpd/

# Dati ftp
I dati dell'ftp sono disponibili in /docker/ftp-data/ che sarà montata come volume


