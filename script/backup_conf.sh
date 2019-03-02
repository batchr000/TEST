HOST=$(hostname)
DATE=$(date +%Y-%m-%d)
LOG=/var/log/ansible_backup/$HOST_$DATE.log
BACKUP=/opt/automation/$HOST

#BACKUP CONF
cp -rp /root/.bashrc $BACKUP/ > $LOG 2>&1
cp -rp /etc/hosts $BACKUP/ >> $LOG 2>&1
ip r > $BACKUP/ip_route >> $LOG 2>&1
cp -rp /etc/systemd/system $BACKUP/ >> $LOG 2>&1

scp -rp $BACKUP ansible:/home/christian/project/TEST/STAGE/ >> $LOG 2>&1
rm -rf $BACKUP/* >> $LOG 2>&1
