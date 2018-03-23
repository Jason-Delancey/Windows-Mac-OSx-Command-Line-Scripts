::Join a PC to the domain
::Disable firewall on domain, join pc to domain, enable firewall on domain
echo Joining a PC to the domain...
netsh advfirewall set allprofiles state off
set /p computer1="Please enter the name/IP of the machine to join:"
set /p user1="Please enter the username of a local admin on the machine:"
set /p password1="Please enter the password:"
set /p password2="Please enter the domain admin password:"
netdom join %computer1% /domain:%ComputerName% /ou:OU=PC_Lab_Environment1,DC=home,DC=jrd2172 /userd:%USERNAME% /passwordd:%password2% /usero:%user1% /passwordo:%password1% /reboot
netsh advfirewall set allprofiles state on

pause
