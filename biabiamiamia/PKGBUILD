# Maintainer: Yangtse <yangtsesu@gmail.com>

pkgname=biabiamiamia
pkgver=1.5.20130315
pkgrel=1
pkgdesc="Baidu music download tool"
arch=(i686 x86_64)
url="https://code.google.com/p/yangyanggnu"
license=('unknown')
depends=('curl')
makedepends=('cmake')
options=(!libtool)
source=(https://yangyanggnu.googlecode.com/files/${pkgname}_v${pkgver}.tar.bz2)
md5sums=('25f45a546fa44629a3e48af08742d986')

build() {
  cd ${pkgname}_v${pkgver}
  
  cmake .
  make
}

package() {
  cd ${pkgname}_v${pkgver}
  make DESTDIR=${pkgdir} install
}
