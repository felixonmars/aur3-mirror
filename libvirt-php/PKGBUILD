# Maintainer: Ansgar Taflinski <ataflinski@uni-koblenz.de>

pkgname=libvirt-php
pkgver=0.4.8
pkgrel=1
pkgdesc="PHP bindings for libvirt"
arch=(x86_64 i686)
url="http://libvirt.org/php/"
license=('GPL')
groups=
provides=
depends=('php')
makedepends=('gcc')
source=(http://libvirt.org/sources/php/$pkgname-$pkgver.tar.gz)
md5sums=('b634cb6415e8f01324e626acadb9e5dc')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
