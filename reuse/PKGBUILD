# Maintainer: Bin Jin <bjin1990+arch [at] gmail [dot] com>

pkgname=reuse
pkgver=4.3.11
pkgrel=1
pkgdesc="a componment required by the ejudge system, a contest management system"
url="http://www.ejudge.ru"
arch=('x86_64' 'i686')
license=('LGPL2.1')
depends=('libcap')
makedepends=('make' 'gcc')
conflicts=()
replaces=()
backup=()
source=("http://www.ejudge.ru/download/reuse-${pkgver}.tgz")
md5sums=('a8a8f75b67f9994c610edafc36dbba27')
optdepends=('kernel26-ejudge: kernel patch to enable strict memory and secure check')

build() {
  cd ${srcdir}/${pkgname}/source
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}/source
  DESTDIR=${pkgdir} make install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
