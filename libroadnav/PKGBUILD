# Contributor: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=libroadnav
pkgver=0.19
pkgrel=2
pkgdesc="An open source and cross-platform street navigation solution"
arch=('i686' 'x86_64')
url="http://roadnav.sourceforge.net/"
license=('LGPL')
depends=('wxgtk')
source=(http://downloads.sourceforge.net/roadnav/$pkgname-$pkgver.tar.gz)
md5sums=('02d90e3fa415955432538c4294e7debe')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --prefix=/usr || return 1
  make  || return 1
  make DESTDIR="$pkgdir" install || return 1
}
