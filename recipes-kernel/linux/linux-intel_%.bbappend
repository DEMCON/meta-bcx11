FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "\
    file://dollar_cove_pmic.cfg \
    file://sound_sst_rt5645.cfg \
    file://i2c_gpio_pca9555.cfg \
"
