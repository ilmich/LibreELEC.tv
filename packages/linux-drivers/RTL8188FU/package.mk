# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="RTL8188FU"
PKG_VERSION="751882b3d8925b72ed796f40e38c0232ccc24785"
PKG_SHA256="fb4996b5dc8d33fe17e28b4e70da0beb93d8e5933e06346563ecb2b1f085cba3"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/kelebek333/rtl8188fu/"
PKG_URL="https://github.com/kelebek333/rtl8188fu/archive/${PKG_VERSION}.tar.gz"
PKG_LONGDESC="Realtek RTL8188FU Linux 3.x driver"
PKG_IS_KERNEL_PKG="yes"

pre_make_target() {
  unset LDFLAGS
}

make_target() {
  make V=1 \
       ARCH=${TARGET_KERNEL_ARCH} \
       KSRC=$(kernel_path) \
       CROSS_COMPILE=${TARGET_KERNEL_PREFIX} \
       CONFIG_POWER_SAVING=n \
       USER_EXTRA_CFLAGS="-Wno-error=date-time"
}

makeinstall_target() {
  mkdir -p ${INSTALL}/$(get_full_module_dir)/${PKG_NAME}
    cp *.ko ${INSTALL}/$(get_full_module_dir)/${PKG_NAME}
}
