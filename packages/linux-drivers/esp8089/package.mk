# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="esp8089"
PKG_VERSION="fef37cfed761803c4462453dba2d2efebbb659b2"
PKG_SHA256="d723b70b29ff00fd1391a16171673c256c29170403bc369148a11d2ee1148b2f"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/al177/esp8089"
PKG_URL="https://github.com/al177/esp8089/archive/${PKG_VERSION}.tar.gz"
PKG_LONGDESC="esp8089 Linux driver"
PKG_IS_KERNEL_PKG="yes"

pre_make_target() {
  unset LDFLAGS
}

make_target() {
  make V=1 \
       KVERS_ARCH=${TARGET_KERNEL_ARCH} \
       KBUILD=$(kernel_path) \
       CROSS_COMPILE=${TARGET_KERNEL_PREFIX} \
       CONFIG_POWER_SAVING=n \
       USER_EXTRA_CFLAGS="-Wno-error=date-time"
}

makeinstall_target() {
  mkdir -p ${INSTALL}/$(get_full_module_dir)/${PKG_NAME}
  cp *.ko ${INSTALL}/$(get_full_module_dir)/${PKG_NAME}
}
