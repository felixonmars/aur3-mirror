# Maintainer: perlawk

pkgname=spitbol
pkgver=13.05
pkgrel=1
pkgdesc="spitbol: An efficient implementation of the SNOBOL4 programming language."
url="http://www.snobol4.org"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=()
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=("http://spitbol.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
	sed -i 's!lib/i386-linux-gnu!lib32!' makefile
  make
}
 
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p "$pkgdir"/usr/bin
	mkdir -p "$pkgdir"/usr/share/spitbol
	cp bin/*spitbol "$pkgdir"/usr/bin
	cp demos "$pkgdir"/usr/share/spitbol -a
}
md5sums=('95a991e4fa3cf16c652f3e37d19fdd90')
