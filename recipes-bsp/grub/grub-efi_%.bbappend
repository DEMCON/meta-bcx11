LICENSE = "GPLv3"
LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

# GRUB itself does not have a runtime dependency on freetype or diffutils
# grub-efi does not require grub-common (because this is the installed version on ESP)
RDEPENDS_${PN}_class-target = "virtual/grub-bootconf"
# need grub-common to install grub, grub-mkfont needs freetype-native
DEPENDS_class-target = "diffutils freetype-native grub bison-native flex-native grub-efi-native"

SRC_URI += " file://grub-embed-cfg.cfg"

GRUB_BUILDIN = "boot linux ext2 fat serial part_msdos part_gpt normal \
                efi_gop iso9660 configfile search loadenv test gfxterm gfxterm_background gfxmenu png font echo"

# the default embedded cfg is just plain wrong about where grub.cfg is located
# we know that it is always alongside our EFI binary
do_replacecfg() {
	cp ${WORKDIR}/grub-embed-cfg.cfg ${WORKDIR}/cfg
}

addtask replacecfg before do_mkimage after do_compile
