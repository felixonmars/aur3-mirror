# Maintainer: libernux <dutchman55@gmx.com>

pkgname=addresses
pkgver=0.4.7
pkgrel=1
pkgdesc="The GNUstep Mail"
arch=(i686 x86_64)
url="http://gap.nongnu.org/addresses"
license=('GPL')
depends=(gnustep-base gnustep-gui gnustep-back)
makedepends=(gcc-objc)
provides=(addresses)
source=(http://savannah.nongnu.org/download/gap/Addresses-$pkgver.tar.gz)
md5sums=('a0cefd17e321f1f611a963aef710a316')


build() {
  cd $srcdir/Addresses
  # necessary to set environment if not in user startup.
  . /usr/share/GNUstep/Makefiles/GNUstep.sh
  make
  make DESTDIR=$pkgdir install
}

