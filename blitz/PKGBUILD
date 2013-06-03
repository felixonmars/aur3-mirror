# Contributor: Gleidson <gleidson_el@yahoo.com.br>
# Maintainer: Carl <carl.rogers@gmail.com>

pkgname=blitz
pkgver=0.10
pkgrel=4
pkgdesc="C++ Class library for scientific computing"
arch=('i686' 'x86_64')
url="http://www.sourceforge.net/projects/blitz/"
license=('GPL''custom')
depends=('gcc' 'boost-libs')
makedepends=('boost')
options=('!docs' '!libtool')
source=(http://downloads.sourceforge.net/sourceforge/blitz/blitz-$pkgver.tar.gz)
md5sums=('66268b92bda923735f2e3afc87dcb58a')

build() {
  cd $srcdir/blitz-$pkgver

  # Install license
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  
  ./configure CXX=g++ --prefix=/usr --enable-serialization --enable-shared --enable-64bit || return 1
  make DESTDIR=$pkgdir install || return 1
}
