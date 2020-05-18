BCX11 Board Support Package layer
=====================================

The BCX11 board is used by avalue in their Panel PC products. This board is based on a Bay Trail-T CR platform and is usually paired with a touchscreen panel.

Dependencies
------------

This layer depends on meta-intel to provide generic support for Intel-based hardware.

    URI: http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel
    branch: dunfell
    revision: HEAD

Machine specific features
-------------------------

This layer adds the following features on top of meta-intel.

  * ALSA UCM state

    Most distribution restore alsa state using save and restore provided by ALSA. The ALSA Use Case Manager is a new approach at controlling audio hardware. This layer add a recipe that uses alsaucm to control audio state. By default it should select the speaker output of the board and you might want to change that to headphones depending on your product.

  * Patches for the Linux kernel

    - The BCX11 board audio routing is different than the vanilla Linux Intel kernel uses. This is very hardware specific and this layer adds a patch that fixes the audio routing for the BCX11 board using DMI matches whilst probing the hardware.
    - The BCX11 uses a Dollar Cove PMIC. The driver for this PMIC is enabled.
    - The BCX11 uses a PCA9555 GPIO expander on the i2c bus for some of the GPIO pins. This layer enables the driver for this chip.
    - Sound on the BCX11 uses Intel SST with a RT5645 codec. This layer enables the relevant kernel configuration options.

    - The Sound Open Firmware project should also support this board but the kernel from meta-intel is too old to support a recent ABI.

  * OpenGL ES with Mesa

    The appropriate drivers are enabled. Note that this layer also strips any unneeded Mesa drivers from the build.
