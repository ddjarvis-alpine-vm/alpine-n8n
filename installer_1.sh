#!/bin/sh

# 1. Initialize Repos and Packages
echo "[[ Step 1. Initialize Repos and Packages ]]"
sed -i -E 's|#(https?://.+/community)|\1|' /etc/apk/repositories
apk update
apk add bash nano vim git curl wget doas openssh chrony tzdata docker shadow ca-certificates
echo -ne "\n\n"

# 2. Set-up User Profile
echo "[[ Step 2. Set-up User Profile ]]"
HOME_LINE="$(cat /etc/passwd | grep "/home")"
HOME_LINE_STATUS="$?"
if [ $HOME_LINE_STATUS -ne 0 ]; then
    read -p "Enter username: " USERNAME
	adduser "${USERNAME}" || \
	    (echo "Failed to create user ${USERNAME}. Unable to continue"; exit)
else
    USERNAME="$(echo "$HOME_LINE" | cut -d ':' -f 1)"
fi
usermod -aG wheel "${USERNAME}"
echo 'permit nopass :wheel' >> /etc/doas.conf
addgroup docker
usermod -aG docker "${USERNAME}"
echo -ne "\n\n"


# 3. Start Services
echo "[[ Step 3. Start Services ]]"
rc-service docker start
rc-update add docker default
rc-service sshd start
rc-update add sshd default
rc-service chronyd start
rc-update add chronyd default
echo -ne "\n\n"

echo "Installer 1 complete. Login to non-root user before starting installer 2."

sleep 5