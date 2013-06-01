# Maintainer: DavidK <david_king at softhome dot net>
# Contributor: Laszlo Papp <djszapi @ gmail at com>
pkgname=cgic
pkgver=205
pkgrel=5
pkgdesc="An ANSI C library for CGI Programming"
arch=('i686' 'x86_64')
url="http://www.boutell.com/cgic/"
license=('GPL')
depends=('glibc')
source=(http://www.boutell.com/${pkgname}/${pkgname}${pkgver}.tar.gz)
md5sums=('49c2120d92c53cd673fac19b1596d31d')

build() {
  cd "$srcdir/$pkgname$pkgver"
  make || return 1
}

package() {
  cd "$srcdir/$pkgname$pkgver"
  install -Dm755 cgictest.cgi ${pkgdir}/usr/bin/cgictest.cgi || return 1
  install -Dm755 capture ${pkgdir}/usr/bin/capture || return 1
  install -Dm755 cgic.h ${pkgdir}/usr/include/cgic.h || return 1
}
