# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="RTL8192FU"
PKG_VERSION="bfe289f4fba8ae488c4cbb21e95f1aa9d2539a0d"
PKG_SHA256="c6330e6f7c7d5ed37e5d96710198385745ea40f0a9b3c34a8a9240b8222adea4"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/kelebek333/rtl8192fu-dkms/"
PKG_URL="https://github.com/kelebek333/rtl8192fu-dkms/archive/${PKG_VERSION}.tar.gz"
PKG_LONGDESC="Realtek RTL8192FU Linux 3.x driver"
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
