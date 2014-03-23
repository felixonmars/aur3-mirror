# $Id: PKGBUILD 204737 2014-01-26 10:45:02Z thomas $
# Maintainer: Paul Mattal <paul@archlinux.org>

pkgname=lirc-lts
pkgver=0.9.0
pkgrel=20
_extramodules=extramodules-3.10-lts
arch=('i686' 'x86_64')
url="http://www.lirc.org/"
license=('GPL')
makedepends=('help2man' 'linux-lts>=3.10' 'linux-lts-headers>=3.10' 'alsa-lib'
'libx11' 'libftdi-compat' 'libirman' 'python2')
options=('!makeflags' '!strip')
source=(http://prdownloads.sourceforge.net/lirc/lirc-${pkgver}.tar.bz2
        lirc_wpc8769l.patch
        lircd-handle-large-config.patch
        lirc_atiusb-kfifo.patch
        kernel-2.6.39.patch
        linux-3.8.patch
        lirc.logrotate
        lirc.service 
        lircm.service 
        irexec.service
        lirc.tmpfiles)
md5sums=('b232aef26f23fe33ea8305d276637086'
         '1cce37e18e3f6f46044abab29016d18f'
         'b70cc9640505205446ec47b7d4779f38'
         '1f8b104a2365d9f93404b143f499059b'
         '087a7d102e1c96bf1179f38db2b0b237'
         '9ee196bd03ea44af5a752fb0cc6ca96a'
         '3deb02604b37811d41816e9b4385fcc3'
         'a9ab637e7207472e61e55a2fa75dc555'
         '1847b9997685bc3ad2cf11bea4590a92'
         '07131d117fcfe9dcd50c453c3a5e9531'
         'febf25c154a7d36f01159e84f26c2d9a')

prepare() {
  cd "${srcdir}/lirc-${pkgver}"
  patch -Np1 -i "${srcdir}/lirc_wpc8769l.patch"
  patch -Np1 -i "${srcdir}/lircd-handle-large-config.patch"
  patch -Np1 -i "${srcdir}/lirc_atiusb-kfifo.patch"
  patch -Np1 -i "${srcdir}/kernel-2.6.39.patch"
  patch -Np1 -i "${srcdir}/linux-3.8.patch"

  # use fixed instead of Courier w/xmode2, should be more prevalent on linux boxen
  sed -i -e 's|char.*font1_name.*Courier.*$|char		font1_name[]="-misc-fixed-*-r-*-*-12-*-*-*-*-*-iso8859-1";|g' tools/xmode2.c

  # use /dev/lirc0 by default instead of /dev/lirc
  sed -i -e 's|#define DEV_LIRC	"lirc"|#define DEV_LIRC	"lirc0"|' config.h.in

  sed -i '/AC_PATH_XTRA/d' configure.ac
  sed -e 's/@X_CFLAGS@//g' \
      -e 's/@X_LIBS@//g' \
      -e 's/@X_PRE_LIBS@//g' \
      -e 's/@X_EXTRA_LIBS@//g' -i Makefile.am tools/Makefile.am

  # fix for new automake #33497
  sed -i 's/AM_CONFIG_HEADER/AC_CONFIG_HEADER/' configure.ac
  libtoolize
  autoreconf
}

build() {
  _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
  cd "${srcdir}/lirc-${pkgver}"

  PYTHON=python2 ./configure --enable-sandboxed --prefix=/usr \
      --with-driver=all --with-kerneldir=/usr/src/linux-${_kernver}/ \
      --with-moduledir=/usr/lib/modules/${_kernver}/kernel/drivers/misc \
      --sbindir=/usr/bin --with-transmitter

  # Remove drivers already in kernel
  sed -e "s:lirc_dev::" -e "s:lirc_bt829::" -e "s:lirc_igorplugusb::" \
      -e "s:lirc_imon::" -e "s:lirc_parallel::" -e "s:lirc_sasem::" \
      -e "s:lirc_serial::" -e "s:lirc_sir::" -e "s:lirc_ttusbir::" \
      -e "s:lirc_atiusb::" -e "s:lirc_i2c::" \
      -i Makefile drivers/Makefile drivers/*/Makefile tools/Makefile
  make
}

package() {
  pkgdesc="Linux Infrared Remote Control kernel modules for stock arch kernel"
  depends=('lirc-utils' 'linux-lts>=3.10')
  replaces=('lirc+pctv')
  install=lirc.install

  cd "${srcdir}/lirc-${pkgver}/drivers"
  make DESTDIR="${pkgdir}" moduledir="/usr/lib/modules/${_extramodules}" install

  # set the kernel we've built for inside the install script
  sed -i -e "s/EXTRAMODULES=.*/EXTRAMODULES=${_extramodules}/g" "${startdir}/lirc.install"
  # gzip -9 modules
  find "${pkgdir}" -name '*.ko' -exec gzip -9 {} \;
}
