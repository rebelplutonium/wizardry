#!/bin/sh

/usr/bin/sudo /usr/bin/apt-get update --assume-yes &&
/usr/bin/sudo /usr/bin/apt-get install --assume-yes curl &&
/usr/bin/sudo /usr/bin/mkdir /nix &&
/usr/bin/sudo /usr/bin/chown $( /usr/bin/whoami ):$( /usr/bin/whoami ) /nix &&
/usr/bin/curl -L https://nixos.org/nix/install | /usr/bin/sh &&
/usr/bin/sudo /usr/bin/apt-get install --assume-yes direnv &&
(
    /usr/bin/cat >> ${HOME}/.bashrc <<EOF
source ${HOME}.nix-profile/etc/profile.d/nix.sh
eval "\$( /usr/bin/direnv hook bash )"
EOF
) &&
/usr/bin/sudo snap install rpi-imager