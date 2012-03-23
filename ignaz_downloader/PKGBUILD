# Contributor: Vamp898 <vamp898@web.de>
pkgname=ignaz_downloader
pkgver=0.11.0
pkgrel=1
pkgdesc="An download tool for files from http://www.ignaz.org"
arch=('i686' 'x86_64')
url="http://www.ignaz.org"
license=('GPL')
depends=( 'qt' )
source=(http://www.ignaz.org/files/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgname"

  mkdir -p $pkgdir/usr/bin
  qmake
  make || return 1
  cp ./bin/ignaz_downloader $pkgdir/usr/bin/
}
md5sums=('71e927f6d5f0671524542753e91fca2f')
