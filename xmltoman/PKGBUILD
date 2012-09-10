# Maintainer: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgname=xmltoman
pkgver=0.4
pkgrel=1
pkgdesc="XML to Man converter"
arch=('any')
url="http://sourceforge.net/projects/xmltoman/"
license=('GPL')
depends=('perl')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgname}-${pkgver}.tar.gz/${pkgname}-${pkgver}.tar.gz")
md5sums=('99be944b9fce40b3fe397049bf14a097')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}
