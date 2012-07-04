# Contributor: libernux <dutchman55@gmx.com>
# Maintainer: <Stefan-Husmann@t-online.de>
pkgname=gspdf
pkgver=0.5
pkgrel=1
pkgdesc="GNUstep pdf and ps viewer"
arch=('i686' 'x86_64')
url="http://gap.nongnu.org/gspdf/index.html"
license=('GPL')
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back' 'ghostscript')
makedepends=('gcc-objc')
provides=('gspdf')
source=(http://savannah.nongnu.org/download/gap/GSPdf-$pkgver.tar.gz)
md5sums=('098acc3b5a28ede7deecf6db9c7faf4e')

build() {
  cd $srcdir/GSPdf-$pkgver
  # necessary to set environment if not in user startup.
  . /usr/share/GNUstep/Makefiles/GNUstep.sh
  make
}
package() {
  cd $srcdir/GSPdf-$pkgver
  . /usr/share/GNUstep/Makefiles/GNUstep.sh
  make DESTDIR=$pkgdir install
}

