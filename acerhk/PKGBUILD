# $Id: PKGBUILD 23215 2010-08-08 21:04:28Z cbrannon $
# Maintainer: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: Marco Fister <marco@rda26.net>

pkgname=acerhk
pkgver=0.5.35
pkgrel=26
pkgdesc="Acer hotkey driver"
url="http://www.cakey.de/acerhk/"
arch=('i686') # Unavailable for x86_64
license=('GPL')
depends=('linux>=3.0.0')
makedepends=('linux-headers>=3.0.0')
source=(http://www.cakey.de/acerhk/archives/${pkgname}-${pkgver}.tgz acerhk.rc
        2.6.30.patch kernelversion.patch 5100.patch 2.6.36.patch)
install=acerhk.install
_kernver=3.0-ARCH

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i 's/CFLAGS/EXTRA_CFLAGS/' Makefile
  patch -Np1 -i "${srcdir}/5100.patch" || return 1
  patch -Np1 -i "${srcdir}/2.6.30.patch" || return 1
  patch -Np0 -i "${srcdir}/2.6.36.patch" || return 1
  patch -N -p1 < "$srcdir/kernelversion.patch" || return 1
  sed -i 's@linux/config.h@linux/input.h@' "${srcdir}/${pkgname}-${pkgver}/acerhk.c"
  # Set KERNELSRC.  The makefile tries to autodetect it with uname,
  # but that is unreliable.
  make CONFIG_FUNCTION_TRACER= KERNELSRC="/lib/modules/${_kernver}/build" acerhk.ko || return 1
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/acerhk.ko" \
    "${pkgdir}/lib/modules/${_kernver}/kernel/drivers/block/acerhk.ko" || return 1
  install -Dm755 "${srcdir}/acerhk.rc" "${pkgdir}/etc/rc.d/acerhk" || return 1
}

# vim:set ts=2 sw=2 et:
md5sums=('05255919f312cb76af473a760c284433'
         '935584b3e4bfbb3af8460558e5b98bb5'
         '2a0bc99e5b12e25096441df4d53d7df7'
         'fd2ef062ecbc9d670e1b42aa5866d32d'
          '8966a93e66200a535179cf9eb689fe4d'
	  'd257a4e9223ebfde48b9608805df9c99')
