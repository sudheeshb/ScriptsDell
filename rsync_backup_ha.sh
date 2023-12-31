#!/bin/bash

# A script to perform incremental backups using rsync

set -o errexit
set -o nounset
set -o pipefail

SERVER_NAME="sudheesh@dell5060"

readonly SOURCE_DIR="/usr/share/hassio/homeassistant/backups"
readonly BACKUP_DIR="/media/hdrive/Backup/RSync/HA"
readonly DATETIME="$(date '+%Y-%b-%d_%H:%M:%S')"
readonly BACKUP_PATH="${BACKUP_DIR}/${DATETIME}"
readonly LATEST_LINK="latest"


rsync -avR  \
  "${SOURCE_DIR}/" \
  --link-dest "../${LATEST_LINK}" \
  "$SERVER_NAME:${BACKUP_PATH}"


ssh $SERVER_NAME rm -rf "$BACKUP_DIR/${LATEST_LINK}"
ssh $SERVER_NAME ln -s "${BACKUP_PATH}" "${BACKUP_DIR}/${LATEST_LINK}"


