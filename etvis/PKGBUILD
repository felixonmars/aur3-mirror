# Contributor: Sebastian Sareyko <public@nooms.de>

pkgname=etvis
pkgver=0.03
pkgrel=2
pkgdesc="A demo viewer/commenter for Wolfenstein: Enemy Territory"
depends=('libglade')
arch=('i686' 'x86_64')
license=('GPL2')
source=(http://nooms.de/files/etvis/$pkgname-$pkgver.tar.gz)
url="http://nooms.de/projects/etvis.html"
md5sums=('fa96e08c8a78e9ff0293c86eafd7d1f1')

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr

  make || return 1
  make DESTDIR=$pkgdir install
}
