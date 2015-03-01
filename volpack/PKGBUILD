# Maintainer: Panos Stergiotis <panos.stergiotis@gmx.net>
pkgname=volpack  
pkgver=1.0b3
pkgrel=1
pkgdesc="stanfords volume rendering library"
url="http://graphics.stanford.edu/software/volpack/"
arch=('i686' 'x86_64')
license=('custom:BSD')
depends=()
source=(http://graphics.stanford.edu/software/$pkgname/$pkgname-$pkgver.tar.Z)
md5sums=('8cc1632f33dc36b7d8139e4551827bb9')
options=('!libtool')
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr 
  sed -i 's/makeopts vp_opts.c/.\/makeopts vp_opts.c/g' Makefile 
  make
  make examples
}
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -d "${pkgdir}/usr"
  install -D -m644 ../../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  make prefix="${pkgdir}/usr" MAN_DIR="${pkgdir}/usr/share/man/" install
}

