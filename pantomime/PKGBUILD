# Maintainer: libernux <dutchman55@gmx.com>

pkgname=pantomime
pkgver=1.2.0
pkgrel=1
pkgdesc="GNUstep mail framework"
arch=(i686 x86_64)
url="http://www.gnustep.org/softwareindex/showdetail.php?app=5"
license=('GPL')
depends=(gnustep-base gnustep-gui gnustep-back)
makedepends=(gcc-objc)
provides=(pantomime)
source=(http://download.gna.org/gnustep-nonfsf/Pantomime-$pkgver.tar.gz)
md5sums=('a8ad6330f67defad47a99a985e2673fb')


build() {
  cd $srcdir/Pantomime-$pkgver
  # necessary to set environment if not in user startup.
  . /usr/share/GNUstep/Makefiles/GNUstep.sh
  make
  make DESTDIR=$pkgdir install
}

