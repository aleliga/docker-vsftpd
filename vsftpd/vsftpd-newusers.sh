#!/bin/bash
test -x /usr/bin/db_load || echo "Installa db-util" && exit 1
db_load -T -t hash -f vsftpd_pass.txt vsftpd_login.db

