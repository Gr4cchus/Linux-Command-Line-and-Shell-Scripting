#!/usr/bin/env bash
# read -p "Type in the linux family (redhat or debian) of the machine in lowercase: " a1
# echo "You have choosen $a1"

history > $(whoami)-command_history.txt
if [ $? -eq 0 ]; then
    echo "Good:current user terminal history obtained"
else
    echo "Failed"
fi

alias > $(whoami)-aliases.txt
if [ $? -eq 0 ]; then
    echo "Good:aliases obtained"
else
    echo "Failed"
fi
# ABOVE THIS POINT
hostnamectl > hostnamectl-host_information.txt
if [ $? -eq 0 ]; then
    echo "Good:hostnamectl information obtained"
else
    echo "Failed"
fi

cat /etc/passwd > passwd.txt
if [ $? -eq 0 ]; then
    echo "Good:/etc/passwd obtained"
else
    echo "Failed"
fi

cat /etc/group > group.txt
if [ $? -eq 0 ]; then
    echo "Good:/etc/group obtained"
else
    echo "Failed"
fi

last -f /var/log/wtmp > last-last_logged_in_users.txt
if [ $? -eq 0 ]; then
    echo "Good:/var/log/wtmp interpreted & obtained"
else
    echo "Failed"
fi

sudo dnf history > dnf-history_package_manager_history.txt
if [ $? -eq 0 ]; then
    echo "Good:dnf history (package manager) obtained"
else
    echo "Failed, maybe you use a different package manager other than dnf"
fi

lastlog > lastlog-most_recent_login_of_all_users.txt
if [ $? -eq 0 ]; then
    echo "Good:lastlog logins obtained"
else
    echo "Failed"
fi

w > w-current_logged_in_users.txt
if [ $? -eq 0 ]; then
    echo "Good:w, current logged in users obtained"
else
    echo "Failed"
fi
# BELOW THIS POINT - susceptable to Failure, need linux distro checking feature
sudo cat /var/log/auth > var-log-auth-auth_logs.txt
if [ $? -eq 0 ]; then
    echo "Good:/var/log/auth log obtained"
else
    echo "Failed: maybe this only works on the debian family"
fi

sudo cat /var/log/auth.log > var-log-auth-auth_logs.txt
if [ $? -eq 0 ]; then
    echo "Good:/var/log/auth.log log obtained"
else
    echo "Failed-Duplicate: maybe this only works on the debian family"
fi

sudo cat /var/log/secure > var-log-secure-login_records.txt
if [ $? -eq 0 ]; then
    echo "Good:/var/log/secure log obtained"
else
    echo "Failed: maybe this only works on the redhat family"
fi

cat /var/log/messages > var-log-messages-log_general.txt
if [ $? -eq 0 ]; then
    echo "Good:/var/log/messages log obtained"
else
    echo "Failed: this system may be running systemd"
fi
# ABOVE THIS POINT

echo "Would you like to compress all these files for easy transfer?"
read -p "Press y or n (lowercase): " X

if [ "$X" = "y" ]; then
    tar cvf Forencics-Logs.tar *.txt
    echo "The End..."
else
    echo "The End..."
fi
