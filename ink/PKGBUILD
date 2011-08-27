# Maintainer: Alexander Fehr <pizzapunk gmail com>

pkgname=ink
pkgver=0.5.1
pkgrel=1
pkgdesc="Command line tool for checking the ink level of printers"
arch=('i686' 'x86_64')
url="http://ink.sourceforge.net/"
license=('GPL2')
depends=('libinklevel')
source=(http://downloads.sourceforge.net/ink/ink-$pkgver.tar.gz)
md5sums=('df09c4a1a404dd37ffff80ce2491ab6d')

build() {
  cd $srcdir/ink-$pkgver

  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
