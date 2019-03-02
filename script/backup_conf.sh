HOST=$(hostname)
DATE=$(date +%Y%m%d%M_%H-%M)
LOG=/var/log/ansible_backup/$HOST_$DATE.log
BACKUP=/opt/automation/$HOST

#BACKUP CONF
cp -rp /root/.bashrc $BACKUP/ > $LOG 2>&1
cp -rp /etc/hosts $BACKUP/ >> $LOG 2>&1
ip r > $BACKUP/ip_route >> $LOG 2>&1
cp -rp /etc/systemd/system $BACKUP/ >> $LOG 2>&1

scp -rp $BACKUP ansible:/home/christian/project/TEST/STAGE/ >> $LOG 2>&1
rm -rf $BACKUP/* >> $LOG 2>&1


ssh root@ansible 'cd /home/christian/project/TEST && git add * && git commit -m "Autocommitted from ansible"
&& git push' >> $LOG 2>&1
echo END >> $LOG 2>&1
