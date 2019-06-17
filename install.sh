#/bin/bash
INSTALL () {
    echo -e "Hello! Please enter work dir to variable.list ( default - /etc/backup_ftp ):\n"; read WORKDIR
    case "$WORKDIR" in
        "") WORKDIR='/etc/backup_ftp'
        *) WORKDIR=$WORKDIR
    esac
    mkdir -p $WORKDIR
    cp ./variable.list $WORKDIR/variable.list
    sed "s/WORCKDIR/$WORKDIR" -i ./backup-ftp.sh
    cp ./backup-ftp.sh /usr/local/bin/backup-ftp.sh
    chmod +x /usr/local/bin/backup-ftp.sh
    echo -e "Add new task to crontab?(Y|n)\n"; read A
    case A in
        Y|y) echo -e "Enter backups time ( m h  dom mon dow)\n"; read CRONTIME
            echo "\n#backup-ftp scripts\n$CRONTIME  /bin/bash /usr/local/bin/backup-ftp.sh" >> /var/spool/cron/root
        *) >/dev/null
    esac
    echo -e "Install complete! Edit the file to configure $WORKDIR/variable.list\n"
}
UPDATE () {
    cp ./backup-ftp.sh /usr/local/bin/backup-ftp.sh
    echo -e "Update script /usr/local/bin/backup-ftp.sh complete.\n"
}
UNINSTALL () {

