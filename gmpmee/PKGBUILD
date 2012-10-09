# Maintainer: Jimmy <theotherjimmy[at]gmail[dot]com>
pkgname=gmpmee
pkgver=1.0.7
pkgrel=1
pkgdesc="GMP modular exponent extensin"
url="http://www.verificatum.com/verificatum/index.html"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('gmp' )
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install='gmpmee.install'
source=("http://www.verificatum.com/download/verificatum-full-${pkgver}.tar.gz")
md5sums=('40774da02e08d4df248fb9b1d89a22d3')

build() {
  cd "${srcdir}/verificatum-full-${pkgver}/gmpmee"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/verificatum-full-${pkgver}/gmpmee"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et: