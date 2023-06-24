#!/bin/bash

# A script to perform incremental backups using rsync

set -o errexit
set -o nounset
set -o pipefail

SERVER_NAME="sudheesh@dell5060"

readonly SOURCE_DIR="/nvme/Data/Backup/pfSense"
readonly BACKUP_DIR="/media/hdrive/Backup/RSync/pfSense/"
readonly DATETIME="$(date '+%Y-%b-%d_%H:%M:%S')"
readonly BACKUP_PATH="${BACKUP_DIR}/${DATETIME}"
readonly LATEST_LINK="latest"

#mkdir -p "${BACKUP_DIR}"

rsync -av   --delete "${SOURCE_DIR}/" --link-dest "../${LATEST_LINK}" "$SERVER_NAME:${BACKUP_PATH}"



ssh $SERVER_NAME rm -rf "$BACKUP_DIR/${LATEST_LINK}"
ssh $SERVER_NAME ln -s "${BACKUP_PATH}" "${BACKUP_DIR}/${LATEST_LINK}"
