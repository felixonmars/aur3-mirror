# Maintainer: libernux <dutchman55@gmx.com>

pkgname=gnumail
pkgver=1.2.0
pkgrel=1
pkgdesc="GNUstep Mail"
arch=(i686 x86_64)
url="http://www.gnustep.org/softwareindex/showdetail.php?app=139"
license=('GPL')
depends=(gnustep-base gnustep-gui gnustep-back pantomime addresses)
makedepends=(gcc-objc)
provides=(gnumail)
source=(http://download.gna.org/gnustep-nonfsf/GNUMail-$pkgver.tar.gz)
md5sums=('beba01820b218988976c2c8e3c783613')


build() {
  cd $srcdir/GNUMail-$pkgver
  # necessary to set environment if not in user startup.
  . /usr/share/GNUstep/Makefiles/GNUstep.sh
  make
  make DESTDIR=$pkgdir install
}

