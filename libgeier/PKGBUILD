# Contributor: Juergen Graefe <jg72@gmx.de>
pkgname=libgeier
pkgver=0.13
pkgrel=1
pkgdesc="A library for validating ELSTER data and processing financial XSLT stylesheets"
arch=('i686' 'x86_64')
url="http://www.taxbird.de/"
license=('GPL')
depends=('xmlsec')
options=('!libtool')
source=(http://www.taxbird.de/download/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('baecd0d98148de0985e8fc3ea0291431')

build() { 
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}
