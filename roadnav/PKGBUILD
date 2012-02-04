# Contributor: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=roadnav
pkgver=0.19
pkgrel=2
pkgdesc="An open source and cross-platform street navigation solution"
arch=('i686' 'x86_64')
url="http://roadnav.sourceforge.net/"
license=('GPL2')
depends=('libroadnav')
source=(http://downloads.sourceforge.net/roadnav/$pkgname-$pkgver.tar.gz)
md5sums=('56f68c4517bd54689df2c6dd9a400c4b')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --prefix=/usr || return 1
  make  || return 1
  make DESTDIR="$pkgdir" install || return 1
}
