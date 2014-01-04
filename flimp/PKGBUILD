# Maintainer: pank <rasmus.pank at gmail dot com>

pkgname=flimp
pkgver=0.0.11
pkgrel=2
pkgdesc="fast light image manipulation program"
arch=('i686' 'x86_64')
url="http://www.ecademix.com/JohannesHofmann/flimp.html"
license=('GPL')
depends=('fltk')
makedepends=('gcc' 'make' 'coreutils')
optdepends=('ImageMagick' 'netpbm' 'dcraw')
source=("http://www.ecademix.com/JohannesHofmann/${pkgname}-${pkgver}.tar.gz"
        "png15.patch::http://www.flpsed.org/hgweb/${pkgname}/raw-diff/f792d00e8f35/src/ImageInfo.cxx")
sha1sums=('86cd922546f78cf16757cd1c9df681b6225aadc9'
          '556b167e4b9206fd859071d0cf7b66ee50d34b7d')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -p1 < ../png15.patch
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
