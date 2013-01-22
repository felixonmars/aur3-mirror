#
pkgname=libcvd
pkgver=20121025
pkgrel=1
pkgdesc="libCVD - computer vision library"
arch=('x86_64' 'i686')

license=('lGPLv2.1')
depends=('toon' 'libdc1394'  'libpng'  'libjpeg'  'libtiff'  'freeglut')
optdepends=()
makedepends=('gcc>=3.1' 'make')
conflicts=()
replaces=()
backup=()
#options=(!strip)
url=("http://www.edwardrosten.com/cvd/")
source=("http://www.edwardrosten.com/cvd/${pkgname}-${pkgver}.tar.gz")
md5sums=('fb8fb6b0cbde674c9f20e060691464a9')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export
  ./configure --prefix=/usr #--with-lapack --with-toon #--enable-gpl
  make
}
 
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/lib/pkgconfig"
  make DESTDIR="${pkgdir}" pkgconfig="${pkgdir}/usr/lib/pkgconfig" install
}
