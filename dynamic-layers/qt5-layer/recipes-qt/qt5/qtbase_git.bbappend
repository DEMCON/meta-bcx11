
# setup eglfs, we might have opengl in DISTRO_FEATURES, this is not correctly handled by qtbase
PACKAGECONFIG_GL_bcx11 = "gles2 eglfs kms gbm"

# we use eglfs
PACKAGECONFIG[kms] = "-kms,-no-kms,virtual/egl"

# testing takes way too long
PACKAGECONFIG_remove = "tests"

PR = "12"

do_configure_prepend_bcx11 () {
	cat > ${S}/mkspecs/oe-device-extra.pri <<EOF
QMAKE_LIBS_EGL += -lEGL
QMAKE_LIBS_OPENGL_ES2 += -lGLESv2 -lEGL
QMAKE_CFLAGS += -m64
QMAKE_CXXFLAGS += -m64
QT_QPA_DEFAULT_PLATFORM = eglfs
EGLFS_DEVICE_INTEGRATION = eglfs_kms
EOF
}
