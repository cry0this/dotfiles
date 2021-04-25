#!/bin/bash
set -ex

REPO_URL="http://chaotic.bangl.de/chaotic-aur/x86_64"
PACKAGE_FILE=$(curl -s -L http://chaotic.bangl.de/chaotic-aur/x86_64/ | grep chaotic-keyring | grep -v sig | awk -F '>' '{print $2}' | awk -F '<' '{print $1}')

curl --output ${PACKAGE_FILE} "${REPO_URL}/${PACKAGE_FILE}"
pacman -U $PACKAGE_FILE
rm $PACKAGE_FILE
