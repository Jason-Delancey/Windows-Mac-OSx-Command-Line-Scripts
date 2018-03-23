::Syncs the server time clock with a network peer

echo Syncing server clock...
net stop w32time
w32tm /config /syncfromflags:manual /manualpeerlist:"0.uk.pool.ntp.org 1.uk.pool.ntp.org"
w32tm /config /reliable:yes
net start w32time
w32tm /resync

pause
