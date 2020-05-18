SUMMARY = "Configure alsa mixer controls using alsa UCM files"
HOMEPAGE = "http://www.alsa-project.org/"
DESCRIPTION = "Service to restore mixer controls on boot using alsaumc, replaces alsa-state as state management"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

PV = "1.0"

SRC_URI = "\
    file://alsa-ucm-state.conf \
    file://alsa-ucm-state.service \
    file://asound.conf \
"

RCONFLICTS_${PN} = "alsa-state alsa-states"
RDEPENDS_${PN} = "alsa-ucm-conf alsa-utils-alsaucm"

S = "${WORKDIR}"

inherit systemd

# we manage this ourselves
SYSTEMD_AUTO_ENABLE = "disable"
SYSTEMD_SERVICE_${PN} = "alsa-ucm-state.service"

FILES_${PN} = "\
    ${systemd_unitdir}/system/alsa-ucm-state.service \
    ${systemd_unitdir}/system/sound.target.wants/alsa-ucm-state.service \
    ${sysconfdir}/alsa/alsa-ucm-state.conf \
    ${sysconfdir}/asound.conf \
"

do_install () {
    install -d ${D}/${sysconfdir}
    install -m 0644 ${S}/asound.conf ${D}/${sysconfdir}/asound.conf

    install -d ${D}/${sysconfdir}/alsa
    install -m 0644 ${S}/alsa-ucm-state.conf ${D}/${sysconfdir}/alsa

    install -d ${D}/${systemd_unitdir}/system
    install -m 0644 ${S}/alsa-ucm-state.service ${D}/${systemd_unitdir}/system

    install -d ${D}/${systemd_unitdir}/system/sound.target.wants
    ln -s ../alsa-ucm-state.service ${D}/${systemd_unitdir}/system/sound.target.wants/alsa-ucm-state.service
}
