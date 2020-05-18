RDEPENDS_libgles2-mesa-dev += "libgles3-mesa-dev"
PROVIDES += "virtual/libgbm"

PACKAGE_ARCH = "${MACHINE_ARCH}"

# this will clearout the fact that this machine also matches x86_64 class targets
unset DRIDRIVERS[_append]

DRIDRIVERS_bcx11 = "i965"
