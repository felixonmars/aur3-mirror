# Contributor: William Rea <sillywilly@gmail.com>
pkgname=slb_rfusb
pkgver=0.9.0
pkgrel=1
pkgdesc="PC/SC Lite driver for Schlumberger Reflex USB branded smartcard readers"
url="https://alioth.debian.org/projects/pcsclite"
license="BSD"
depends=('pcsclite')
source=(http://www.linuxnet.com/drivers/readers/files/slb_rfUSB-drv-$pkgver.tar.gz \
	makefile.diff)
md5sums=('4290725a47918d4f783b308c72a0a1e0' 'cc7509e6652561f9cd9c3431c21353b5')

build() {
  cd $startdir/src/slb_rfUSB
  patch -p1 -i ../makefile.diff
  mkdir -p $startdir/pkg/usr/share/pcsc/drivers
  make || return 1
  make DESTDIR=$startdir/pkg install

  rm -r $startdir/pkg/usr/share/pcsc/drivers/slbReflexUSB.bundle/Contents/MacOS/
}
