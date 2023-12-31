#!/bin/bash

# A script to perform incremental backups using rsync

set -o errexit
set -o nounset
set -o pipefail


readonly SOURCE_DIR="/usr/share/hassio/homeassistant/backup"
readonly BACKUP_DIR=" sudheesh@dell5060:/media/hdrive/Backup/RSync/HA"
readonly DATETIME="$(date '+%Y-%m-%d_%H:%M:%S')"
readonly BACKUP_PATH="${BACKUP_DIR}/${DATETIME}"
readonly LATEST_LINK="${BACKUP_DIR}/latest"

mkdir -p "${BACKUP_DIR}"

rsync -avR --delete \
  "${SOURCE_DIR}/" \
  --link-dest "${LATEST_LINK}" \
  --exclude 'Frigate/Storage'     --exclude  'Adguard/Work/data'  --exclude 'Unifi/Config/data/db'
  "${BACKUP_PATH}"

rm -rf "${LATEST_LINK}"
ln -s "${BACKUP_PATH}" "${LATEST_LINK}"
