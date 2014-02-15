# Maintainer: neolith2099

pkgname=pecl-lzf
pkgver=1.6.2
pkgrel=1
pkgdesc="This package handles LZF de/compression in PHP"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/lzf"
license=('PHP License')
depends=('php')
source=(http://pecl.php.net/get/LZF-${pkgver}.tgz)
sha1sums=('9e24976b65a000ea09f0860daa1de13d5de4f022')

build() {
  cd ${srcdir}/LZF-${pkgver}
  phpize
  ./configure
}

package() {
  cd ${srcdir}/LZF-${pkgver}
  make INSTALL_ROOT=${pkgdir} install
}
