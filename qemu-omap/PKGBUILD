# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
pkgname=qemu-omap
pkgver=0.13.0
pkgrel=1
pkgdesc="QEMU is a generic and open source processor emulator which achieves a good emulation speed by using dynamic translation. This package incorporates a patch that fixed bugs where certain OMAP systems could not boot, such as the Nokia N810."
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2.1')
url="http://wiki.qemu.org/Index.html"
makedepends=('texi2html' 'perl')
depends=('libjpeg' 'libpng' 'sdl' 'alsa-lib' 'esound' 'gnutls>=2.4.1' 'bluez' 'vde2' 'util-linux-ng' 'curl' 'libsasl')
backup=('etc/qemu/target-x86_64.conf')
install=qemu.install
source=(http://savannah.nongnu.org/download/qemu/qemu-${pkgver}.tar.gz
        65-kvm.rules
        omap.patch)

build()
{
  cd ${srcdir}/qemu-${pkgver}
  echo "Applying OMAP patch"
  patch -Np1 < ${srcdir}/omap.patch
  echo "Patch done"
  sed -i -e 's/lib64/lib/g' x86_64.ld || return 1
  ./configure --prefix=/usr --sysconfdir=/etc --audio-drv-list=oss,alsa,sdl,esd \
              --audio-card-list=ac97,sb16,es1370,adlib \
              --enable-docs \
              --kerneldir="/usr/src/linux-$(uname -r)"
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
  install -D -m644 ${srcdir}/65-kvm.rules \
                   ${pkgdir}/lib/udev/rules.d/65-kvm.rules
}
md5sums=('397a0d665da8ba9d3b9583629f3d6421'
         'b316a066d2f1bb57d8f5b7ea1d0d1caf'
         'b5130510fb6ab67d7ad32fac7ad4e536')
