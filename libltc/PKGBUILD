# Maintainer: DrZaius <lou[at]fakeoutdoorsman.com>

pkgname=libltc
pkgver=1.1.4
pkgrel=1
pkgdesc="Linear/Logitudinal Time Code (LTC) Library"
arch=('i686' 'x86_64')
license=('GPL3')
url="http://x42.github.io/libltc/"
source=("https://github.com/x42/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('34f7e716c8f0b041bf5f08b62162b1e3')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
