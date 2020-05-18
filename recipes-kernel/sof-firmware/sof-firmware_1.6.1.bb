DESCRIPTION = "Sound Open Firmware firmware and topology binaries"
HOMEPAGE = "https://github.com/thesofproject/sof-bin"

LICENSE = "ISC & BSD"
LIC_FILES_CHKSUM = "\
    file://LICENCE.Intel;md5=54b4f1a2dd35fd85bc7a1d4afa731b78 \
    file://LICENCE.NXP;md5=eb04e5837f4ef87eaa7086f54ae58af7 \
"

SECTION = "kernel"

SRC_URI = "git://github.com/thesofproject/sof-bin.git;protocol=https;branch=stable-v1.6.1"
SRCREV = "b77c851bc4ec1b6b552eaf1a61a66f3df4a13ab8"
PV = "1.6.1"

S = "${WORKDIR}/git"

inherit allarch update-alternatives

FILES_${PN} += "/lib/firmware/intel/*"

do_install () {
    install -d ${D}/lib/firmware/intel/
    install -d ${D}/lib/firmware/intel/sof/
    install -d ${D}/lib/firmware/intel/sof-tplg/
    install -m 0755 ${S}/lib/firmware/intel/sof/v1.6.1/sof-byt-v1.6.1.ri ${D}/lib/firmware/intel/sof/sof-byt.ri
    install -m 0755 ${S}/lib/firmware/intel/sof-tplg-v1.6.1/sof-byt-rt5645.tplg ${D}/lib/firmware/intel/sof-tplg/sof-byt-rt5645.tplg
}
