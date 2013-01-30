# Maintainer: libernux <dutchman55@gmx.com>

pkgname=addresses
pkgver=0.4.8
pkgrel=1
pkgdesc="GNUstep address book"
arch=(i686 x86_64)
url="http://gap.nongnu.org/addresses"
license=('GPL')
depends=(gnustep-base gnustep-gui gnustep-back)
makedepends=(gcc-objc)
provides=(addresses)
source=(http://savannah.nongnu.org/download/gap/Addresses-$pkgver.tar.gz)
md5sums=('35c929e3d2361ab26e3387fa07ca1d29')


build() {
  cd $srcdir/Addresses-${pkgver}
  # necessary to set environment if not in user startup.
  . /usr/share/GNUstep/Makefiles/GNUstep.sh
  make
  make DESTDIR=$pkgdir install
}

