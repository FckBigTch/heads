# AMD GPU firmware from
# https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20240811.tar.xz
# Needed by the kernel build (CONFIG_EXTRA_FIRMWARE), not by coreboot.
msi_b850p_fw_dir := /blobs/msi_b850p/linux-firmware-20240811

$(build)/linux-$(CONFIG_LINUX_VERSION)/linux-$(BOARD)/.configured: $(msi_b850p_fw_dir)

$(msi_b850p_fw_dir):
	$(pwd)/blobs/msi_b850p/download_firmware.sh
	mkdir -p $(PWD)/build/x86/linux-6.6.30/firmware/amdgpu
	cp $(PWD)/$(msi_b850p_fw_dir)/amdgpu/dcn_3_1_4_dmcub.bin $(PWD)/$(msi_b850p_fw_dir)/amdgpu/gc_11_0_1_mes.bin $(PWD)/$(msi_b850p_fw_dir)/amdgpu/gc_11_0_1_mes_2.bin $(PWD)/$(msi_b850p_fw_dir)/amdgpu/gc_11_0_1_pfp.bin $(PWD)/$(msi_b850p_fw_dir)/amdgpu/psp_13_0_4_toc.bin $(PWD)/$(msi_b850p_fw_dir)/amdgpu/gc_11_0_1_me.bin $(PWD)/$(msi_b850p_fw_dir)/amdgpu/gc_11_0_1_mes1.bin $(PWD)/$(msi_b850p_fw_dir)/amdgpu/psp_13_0_4_ta.bin $(PWD)/$(msi_b850p_fw_dir)/amdgpu/gc_11_0_1_mec.bin $(PWD)/$(msi_b850p_fw_dir)/amdgpu/gc_11_0_1_rlc.bin $(PWD)/$(msi_b850p_fw_dir)/amdgpu/gc_11_0_1_imu.bin $(PWD)/$(msi_b850p_fw_dir)/amdgpu/psp_13_0_4_ta.bin $(PWD)/$(msi_b850p_fw_dir)/amdgpu/sdma_6_0_1.bin  $(PWD)/build/x86/linux-6.6.30/firmware/amdgpu
