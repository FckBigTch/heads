#!/usr/bin/env bash
set -euo pipefail

# BLOB_DIR="blobs/msi_b850p"
BLOB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BLOBS_URL="https://dl.3mdeb.com/open-source-firmware/Dasharo/msi_ms7e56/uefi/v0.9.0/PhoenixAM5.zip"
BLOBS_ARCHIVE="PhoenixAM5.zip"
BLOBS_HASH="d474f24dc9dc0f9d59431068056995a434258c69fb0b5e14cee239d9f01f970d  PhoenixAM5.zip"

# Files already exisiting? 
[[ -f "$BLOB_DIR/PhoenixAM5/fw.cfg" && -f "$BLOB_DIR/PhoenixAM5/Phoenix_generic_vbios.bin" ]] && exit 0

curl -fsSL "$BLOBS_URL" -o "$BLOB_DIR/$BLOBS_ARCHIVE"
(
cd "$BLOB_DIR"

# check hashes
if ! echo "$BLOBS_HASH" | sha256sum -c -; then
	echo "Missmatching hashes!"
	exit 1
fi

unzip -o "$BLOBS_ARCHIVE" 
)
 
# set correct directory
sed -i "s|^FIRMWARE_LOCATION.*|FIRMWARE_LOCATION           ${BLOB_DIR}/PhoenixAM5|" "$BLOB_DIR/PhoenixAM5/fw.cfg"
