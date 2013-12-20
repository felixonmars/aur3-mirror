# Maintainer: perlawk

pkgname=spipat
pkgver=0.9.3
pkgrel=1
pkgdesc="SPITBOL Pattern is to enable embedding SNOBOL4 style patterns in popular scripting languages written in C/C++. With Python and C++ bindings."
url="http://www.snobol4.org/spipat"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=()
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=("http://www.snobol4.org/spipat/spipat-0.9.3.tar.gz")
 
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
  make
}
 
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
md5sums=('38d36620efdba1b8c1b2a5f0be0e7a76')
