# Contributor: Robson Cardoso dos Santos <cardoso.rcs@gmail.com>

pkgname=terminal.app
pkgver=0.9.5
pkgrel=1
pkgdesc="Terminal emulator for GNUstep"
arch=(i686)
url="http://gap.nongnu.org/terminal/index.html"
license=('GPL')
depends=('gcc-libs')
source=(http://savannah.nongnu.org/download/gap/Terminal-$pkgver.tar.gz)
md5sums=('ae5fd9bf965eef1acdfadfaa8f4f98c4')

build() {
  patch -Np1 < "$startdir/terminal.patch"
  cd $startdir/src/Terminal-$pkgver
      
  make || return 1
  make DESTDIR=$pkgdir install || return 1
} 

