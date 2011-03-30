# Maintainer: DonVla <donvla@users.sourceforge.net>

pkgname=dvb-usb-rtl2832u-n130
_kernelname="-N130"
_kversion="2.6.38"
pkgver=1.1_${_kversion}
pkgrel=1
pkgdesc="Kernel26-n130 module for the RTL2832U DVB-T USB2.0 device"
arch=('i686')
url="https://build.opensuse.org/package/show?package=dvb-usb-rtl2832u&project=home%3Ajvroosmalen%3Abranches%3Ahome%3Apolyconvex"
license=('GPL')
depends=("kernel26-n130")
install=${pkgname}.install
source=("dvb-usb-rtl2832u.tar.bz2::https://api.opensuse.org/public/source/home:jvroosmalen:branches:home:polyconvex/dvb-usb-rtl2832u/dvb-usb-rtl2832u.tar.bz2?rev=4074ef2d7ae35cc4c97dcd9bd8e318c0&"
        "dvb-usb-rtl2832u-add-device.patch::https://api.opensuse.org/public/source/home:jvroosmalen:branches:home:polyconvex/dvb-usb-rtl2832u/dvb-usb-rtl2832u-add-device.patch?rev=4074ef2d7ae35cc4c97dcd9bd8e318c0&"
        "dvb-usb-rtl2832u-compilefix.patch::https://api.opensuse.org/public/source/home:jvroosmalen:branches:home:polyconvex/dvb-usb-rtl2832u/dvb-usb-rtl2832u-compilefix.patch?rev=4074ef2d7ae35cc4c97dcd9bd8e318c0&")
md5sums=('0d18d892c98364c20e62e42345325803'
         '1308d1b718f18d041ff8f8d125103756'
         'c5b27b462ebff11011f3bd6aa732baa9')
sha256sums=('91b83d2fe406b8d9790b0d5d19b45835cb30d788ce45c2a0d55460467ab3f14e'
            '364545fa6aa1d71812dd04238147ee4e8d739bc51f91b97370569e20d2c7fc9a'
            '84fd31a8a77d7aac10b5e3ca26899e29d8e6f8814f798e06e5ad7c4d039df838')

build() {
  local _KERNEL="${_kversion}${_kernelname}"
  # set KERNEL_VERSION
  sed -e  "s#KERNEL_VERSION=.*#KERNEL_VERSION=${_KERNEL}#g" -i "${startdir}/${install}"

  cd "${srcdir}/dvb-usb-rtl2832u"
  patch -p1 < "${srcdir}/dvb-usb-rtl2832u-compilefix.patch"
  patch -p1 < "${srcdir}/dvb-usb-rtl2832u-add-device.patch"

  export KBUILD_SRC="/usr/src/linux-${_KERNEL}"
  export INSTALL_MOD_PATH="${pkgdir}"
  export INSTALL_MOD_DIR=kernel/drivers/media/dvb/dvb-usb
  make -C "${KBUILD_SRC}" M="$PWD" modules
  make -C "${KBUILD_SRC}" M="$PWD" modules_install
  find "${pkgdir}" -name '*.ko' -exec gzip -9 {} \;
}

# vim:set ts=2 sw=2 et:
