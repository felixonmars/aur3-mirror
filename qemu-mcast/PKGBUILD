# Maintainer: Marek Skrobacki <skrobul@skrobul.com>
pkgname=qemu-mcast
pkgver=0.14.1
pkgrel=2
pkgdesc="QEMU is a generic and open source processor emulator which achieves a good emulation speed by using dynamic translation. This version has been patched to provide multicast functionality (used for GNS3 and Dynamips)."
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2.1')
url="http://wiki.qemu.org/Index.html"
makedepends=('texi2html' 'perl')
depends=('libjpeg' 'libpng' 'sdl' 'alsa-lib' 'esound' 'gnutls>=2.4.1' 'bluez' 'vde2' 'util-linux-ng' 'curl' 'libsasl')
conflicts=('qemu')
backup=('etc/qemu/target-x86_64.conf')
install=qemu.install
source=(http://savannah.nongnu.org/download/qemu/qemu-${pkgver}.tar.gz
        65-kvm.rules
	qemu-${pkgver}-multicast.patch
  struct-siginfo.patch)
options=(!strip)

build()
{
  cd ${srcdir}/qemu-${pkgver}
  patch -p1 --ignore-whitespace -i $srcdir/qemu-0.14.1-multicast.patch || return 1
  patch -p1 --ignore-whitespace -i $srcdir/struct-siginfo.patch || return 1
  sed -i -e 's/lib64/lib/g' x86_64.ld
  ./configure --prefix=/usr --sysconfdir=/etc --audio-drv-list=oss,alsa,sdl,esd \
              --audio-card-list=ac97,sb16,es1370,adlib \
              --enable-docs \
              --kerneldir="/usr/src/linux-$(uname -r)"
              make
}

package() {
  cd ${srcdir}/qemu-${pkgver}
  make DESTDIR=${pkgdir} install
  install -D -m644 ${srcdir}/65-kvm.rules \
                   ${pkgdir}/lib/udev/rules.d/65-kvm.rules
}
md5sums=('b6c713a8db638e173af53a62d5178640'
         'b316a066d2f1bb57d8f5b7ea1d0d1caf'
         '16744fd48654a92fa2b4e2b984d66569'
         '8e08e939b04ce9f4fcc085e9d188b822')
