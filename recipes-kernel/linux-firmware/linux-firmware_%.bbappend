# this adds an explicit firmware package for Intel Smart Sound Technology for Cherry Trail/Braswell

PACKAGES =+ "${PN}-intel-sst-22a8-license ${PN}-intel-sst-22a8"

LICENSE_${PN}-intel-sst-22a8 = "Firmware-fw_sst_0f28"
LICENSE_${PN}-intel-sst-22a8-license = "Firmware-fw_sst_0f28"

FILES_${PN}-intel-sst-22a8-license = " \
    ${nonarch_base_libdir}/firmware/LICENCE.fw_sst_0f28 \
"

FILES_${PN}-intel-sst-22a8 = " \
    ${nonarch_base_libdir}/firmware/intel/fw_sst_0f28.bin \
    ${nonarch_base_libdir}/firmware/intel/fw_sst_0f28.bin-48kHz_i2s_master \
    ${nonarch_base_libdir}/firmware/intel/fw_sst_0f28_ssp0.bin \
"

RDEPENDS_${PN}-intel-sst-22a8 += "${PN}-intel-sst-22a8-license"
