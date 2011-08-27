# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>

pkgname=pengupop
pkgver=2.2.3
pkgrel=1
pkgdesc="Networked Bust a Move/Puzzle Bobble clone"
arch=('i686')
url="http://www.junoplay.com/pengupop"
license="GPL"
depends=('sdl' 'zlib')
source=(http://www.junoplay.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('6341fd2dddf4fe7fdddf3eb707c60750')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
