# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributer: Paul Mattal <paul@archlinux.org>

pkgname=lirc-lts-ck
_pkgname=lirc
pkgver=0.9.0
pkgrel=1
epoch=1
_kernver=2.6.35-lts-ck
arch=('i686' 'x86_64')
url="http://www.lirc.org/"
license=('GPL')
makedepends=('help2man' 'kernel26-lts-ck-headers>=2.6.35' 'kernel26-lts-ck-headers<2.6.36' 'alsa-lib' 'libx11' 'libftdi' 'libirman' 'python')
options=('!makeflags' '!strip')
source=(http://prdownloads.sourceforge.net/${_pkgname}/${_pkgname}-${pkgver}.tar.bz2)

build() {
  cd "${srcdir}/lirc-${pkgver}"

  sed -i '/AC_PATH_XTRA/d' configure.ac
  sed -e 's/@X_CFLAGS@//g' \
      -e 's/@X_LIBS@//g' \
      -e 's/@X_PRE_LIBS@//g' \
      -e 's/@X_EXTRA_LIBS@//g' -i Makefile.am tools/Makefile.am
  libtoolize
  autoreconf

  PYTHON=python2 ./configure --enable-sandboxed --prefix=/usr \
      --with-driver=all --with-kerneldir=/usr/src/linux-${_kernver}/ \
      --with-moduledir=/lib/modules/${_kernver}/kernel/drivers/misc \
      --with-transmitter

  # Remove drivers already in kernel
  sed -e "s:lirc_dev::" -e "s:lirc_bt829::" -e "s:lirc_igorplugusb::" \
      -e "s:lirc_imon::" -e "s:lirc_parallel::" -e "s:lirc_sasem::" \
      -e "s:lirc_serial::" -e "s:lirc_sir::" -e "s:lirc_ttusbir::" \
      -i Makefile drivers/Makefile drivers/*/Makefile tools/Makefile
  make
}

package() {
  pkgdesc="Linux Infrared Remote Control kernel modules for kernel26-ck."
  depends=('lirc-utils' 'kernel26-lts-ck>=2.6.35' 'kernel26-lts-ck<2.6.36')
  replaces=('lirc+pctv')
  install=lirc-lts-ck.install

  cd "${srcdir}/lirc-${pkgver}/drivers"
  make DESTDIR="${pkgdir}" install

  # set the kernel we've built for inside the install script
  sed -i -e "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" "${startdir}/lirc-lts-ck.install"
  # gzip -9 modules
  find "${pkgdir}" -name '*.ko' -exec gzip -9 {} \;
}
sha256sums=('6323afae6ad498d4369675f77ec3dbb680fe661bea586aa296e67f2e2daba4ff')
