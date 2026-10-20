#!/usr/bin/env bash
set -euo pipefail

# BLOB_DIR="blobs/msi_b850p"
BLOB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BLOBS_URL="https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20240811.tar.xz"
BLOBS_ARCHIVE="linux-firmware-20240811.tar.xz"
BLOBS_HASH="58f1a14b800e3d1967986197d83c81f1ad14b7898a557133c58df0c02c538082  linux-firmware-20240811.tar.xz"

# Directory already exisiting? 
[ -d "$BLOB_DIR/linux-firmware-20240811/amdgpu" ] && exit 0

curl -fsSL "$BLOBS_URL" -o "$BLOB_DIR/$BLOBS_ARCHIVE"

(
cd "$BLOB_DIR"

# check hashes
if ! echo "$BLOBS_HASH" | sha256sum -c -; then
        echo "Missmatching hashes!"
        exit 1
fi

# extract only amdgpu directory
tar -xJvf "$BLOBS_ARCHIVE" --wildcards '*/amdgpu/*'

)
