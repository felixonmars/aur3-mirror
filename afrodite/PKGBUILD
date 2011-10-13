# Maintainer: Alexsandr Pavlov <kidoz at mail dot ru>
pkgname=afrodite
pkgver=0.12.1
pkgrel=1
pkgdesc="ibrary containing the completion engine for Vala language"
arch=('i686' 'x86_64')
url="http://code.google.com/p/vtg"
license=('GPL')
depends=('vala')
makedepends=()
source=(http://vtg.googlecode.com/files/vtg-${pkgver}.tar.bz2)
md5sums=('8ef7f1a725f83b5f50e2890ece491ec9')

build() {
  cd "${srcdir}/vtg-${pkgver}"
  
  sed -i 's/VALA_VERSION=0.12/VALA_VERSION=0.14/g' configure*
  
 ./configure --prefix=/usr --disable-vtg-plugin --disable-gen-project --enable-afrodite
  make
}

package() {
  cd "${srcdir}/vtg-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  mv "${pkgdir}/usr/share/doc/vtg/" "${pkgdir}/usr/share/doc/afrodite"
}
