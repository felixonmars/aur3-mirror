# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributer: Paul Mattal <paul@archlinux.org>
# Maintainer: OK100 <ok100.ok100.ok100@gmail.com>

pkgname=lirc-eee-ck
pkgver=0.9.0
pkgrel=2
_kernver=`cat /usr/share/linux-eee-ck/currver | cut -d "'" -f2`
arch=('i686')
url="http://www.lirc.org/"
license=('GPL')
makedepends=('help2man' 'linux-eee-ck-headers' 'alsa-lib' 'libx11' 'libftdi' 'libirman' 'python')
options=('!makeflags' '!strip')
source=(http://prdownloads.sourceforge.net/lirc/lirc-${pkgver}.tar.bz2
        lirc_wpc8769l.patch
        lircd-handle-large-config.patch
        lirc_atiusb-kfifo.patch
        kernel-2.6.39.patch)

build() {
  cd "${srcdir}/lirc-${pkgver}"
  patch -Np1 -i "${srcdir}/lirc_wpc8769l.patch"
  patch -Np1 -i "${srcdir}/lircd-handle-large-config.patch"
  patch -Np1 -i "${srcdir}/lirc_atiusb-kfifo.patch"
  patch -Np1 -i "${srcdir}/kernel-2.6.39.patch"

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
#  sed -e "s:lirc_dev::" -e "s:lirc_bt829::" -e "s:lirc_igorplugusb::" \
#      -e "s:lirc_imon::" -e "s:lirc_parallel::" -e "s:lirc_sasem::" \
#      -e "s:lirc_serial::" -e "s:lirc_sir::" -e "s:lirc_ttusbir::" \
#      -i Makefile drivers/Makefile drivers/*/Makefile tools/Makefile 
#  make
}

package() {
  pkgdesc="Linux Infrared Remote Control kernel modules for linux-eee-ck."
  depends=('lirc-utils' 'linux-eee-ck')
  replaces=('lirc+pctv')
  install=lirc.install

  cd "${srcdir}/lirc-${pkgver}/drivers"
  make DESTDIR="${pkgdir}" install

  # set the kernel we've built for inside the install script
  sed -i -e "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" "${startdir}/lirc.install"
  # gzip -9 modules
  find "${pkgdir}" -name '*.ko' -exec gzip -9 {} \;
}
sha256sums=('6323afae6ad498d4369675f77ec3dbb680fe661bea586aa296e67f2e2daba4ff'
            '137b1169810d1b66c5fe058aaffc2043ecbb4ef6cfce62050f9b418fa924b9ba'
            '474b5709e6604ef2815e6e1a611d77665e3d33be05cd09110330a81a846bc69f'
            'f2a83e2a32c8eb963453214d0337589a293b2327291290ec047f4d78782fb310'
            '3dddd4e9f093ee6fe75b3408da269744a4ffcd5255ea2382f077fb32079a2352')
