# Contributor: Rémy Oudompheng <oudomphe@clipper.ens.fr>
# Contributor: Lex Black <autumn-wind at web dot de>

pkgname=surf-ag
pkgver=1.0.6
pkgrel=1
pkgdesc="Visualization of real algebraic surfaces"
arch=('i686' 'x86_64')
url="http://surf.sf.net/"
license=('GPL')
depends=('gmp' 'gtk' 'libjpeg')
source=(http://downloads.sourceforge.net/sourceforge/surf/surf-$pkgver.tar.gz)
md5sums=('598142168e940a818c7b5a7a66b35082')

build() {
  cd "$srcdir/surf-$pkgver"

  ./configure --prefix=/usr
  make
  make check
}

package() {
  cd "$srcdir/surf-$pkgver"

  make install DESTDIR=$pkgdir
}
