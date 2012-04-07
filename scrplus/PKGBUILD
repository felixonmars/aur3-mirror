# Contributor: fuzzix@gmail.com
pkgname=scrplus
_projectname=SCRplus
pkgver=0.19
pkgrel=1
pkgdesc="SCRplus converts images to formats suitable for use with the ZX Spectrum"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/scrplus/"
license=('GPL3')
depends=('gtk3' 'sdl_image')
source=(http://sourceforge.net/projects/scrplus/files/${pkgname}_$pkgver.tar.gz)
md5sums=('3dc45596963cb8edecadbbff42e9ed8f')

build() {
  cd "${pkgname}_${pkgver}"
  rm scrplus gscrplus libscrplus.o rgbyuv.o bits.o
  make
}

package () {
  cd "${pkgname}_${pkgver}"
  install -D -m755 scrplus "${pkgdir}/usr/bin/scrplus"
  install -D -m755 gscrplus "${pkgdir}/usr/bin/gscrplus"
  install -D -m644 algorithm "${pkgdir}/usr/share/doc/${pkgname}/algorithm"
  install -D -m644 algorithm "${pkgdir}/usr/share/doc/${pkgname}/readme"
}


