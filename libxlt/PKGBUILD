# Maintainer: Ecmel Ercan <ecmel dot ercan at gmail dot com>
pkgname=libxlt
pkgver=13.0.13
pkgrel=2
dirname=Xlt
pkgdesc="LessTif and Motif Extension Library"
url="http://sourceforge.net/projects/xlt/"
arch=('x86_64' 'i686')
license=('LGPL')
depends=(openmotif)
optdepends=()
makedepends=()
source=("http://downloads.sourceforge.net/xlt/${dirname}-${pkgver}.tar.gz")
md5sums=('46b6259c7637d6e9b87520eb91b6ea51') 

build() {
 cd "${srcdir}/${dirname}-${pkgver}"

  ./configure --prefix=/usr
  make
}
 
package() {
  cd "${srcdir}/${dirname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  mkdir -p "${pkgdir}/usr/share/doc/libXlt"
  mv "${pkgdir}/usr/Xlt/doc/html" "${pkgdir}/usr/share/doc/libXlt/html"
  rm -rf "${pkgdir}/usr/Xlt"
}

