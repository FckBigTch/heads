# blobs downloaded from dasharo https://dl.3mdeb.com/open-source-firmware/Dasharo/msi_ms7e56/uefi/v0.9.0/PhoenixAM5.zip, 
# see blobs/msi_b850p/README.md

$(build)/coreboot-$(CONFIG_COREBOOT_VERSION)/$(BOARD)/.build: \
	$(pwd)/blobs/msi_b850p/PhoenixAM5/fw.cfg \
	$(pwd)/blobs/msi_b850p/PhoenixAM5/Phoenix_generic_vbios.bin

$(pwd)/blobs/msi_b850p/PhoenixAM5/fw.cfg:
	$(pwd)/blobs/msi_b850p/download_blobs.sh

$(pwd)/blobs/msi_b850p/PhoenixAM5/Phoenix_generic_vbios.bin: $(pwd)/blobs/msi_b850p/PhoenixAM5/fw.cfg

