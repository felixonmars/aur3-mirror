# Contributor: Robin Martinjak <rob@kingofnerds.net>
pkgname=mimictools
pkgver=1.0.1
pkgrel=2
pkgdesc="Tools for mimic-encoded video streams"
arch=('i686' 'x86_64')
url="http://thegraveyard.org"
license=('GPL')
depends=('libmimic' 'glib2')
source=(http://thegraveyard.org/files/$pkgname-$pkgver.tar.gz)
md5sums=('4c9c139af3da698b2f8cdaa665b5e0d7')

build() {
  cd $srcdir/$pkgname-$pkgver
  make || return 1
  make PREFIX=/usr DESTDIR=$pkgdir/ install
}
