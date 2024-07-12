# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="sci-wifi"
PKG_VERSION="44ac519b7d5d739416294b104ac908076311038d"
PKG_SHA256="94ddd0b0f2f39961b0cc2f53f62ca3a540d3029e395424ab699f7d4ce54ba580"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/rockchip-with-unofficial-love/smartchip-sci-wifi"
PKG_URL="https://github.com/rockchip-with-unofficial-love/smartchip-sci-wifi/archive/${PKG_VERSION}.tar.gz"
PKG_LONGDESC="Smartchip sci Wifi Linux driver"
PKG_IS_KERNEL_PKG="yes"

pre_make_target() {
  unset LDFLAGS
}

make_target() {
  make V=1 \
       ARCH=${TARGET_KERNEL_ARCH} \
       KSRC=$(kernel_path) \
       CROSS_COMPILE=${TARGET_KERNEL_PREFIX}
}

makeinstall_target() {

  mkdir -p $INSTALL/$(get_full_firmware_dir)/smartchip
  cp -v  wifi.cfg $INSTALL/$(get_full_firmware_dir)/smartchip
  cp -v  fw/* $INSTALL/$(get_full_firmware_dir)/smartchip
  
  mkdir -p ${INSTALL}/$(get_full_module_dir)/${PKG_NAME}
    cp *.ko ${INSTALL}/$(get_full_module_dir)/${PKG_NAME}
}
