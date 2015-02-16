# Contributor: perlawk

pkgname=nasmx
pkgver=1.4
pkgrel=3
pkgdesc="NASMX: a collection of macros, include files and examples for linux, x11, gtk, opengl"
arch=('i686' 'x86_64')
url="http://nasmx.sourceforge.net/"
license=('BSD')
depends=('nasm')
install=nasmx.install
source=(http://download.sourceforge.net/project/$pkgname/$pkgname-$pkgver/linux/${pkgname}-${pkgver}.tar.gz)
#http://ncu.dl.sourceforge.net/project/nasmx/nasmx-1.4/linux/nasmx-1.4.tar.gz

package() {
  cd ${pkgname}-${pkgver}/demos
	mkdir -p "${pkgdir}"/usr/include/nasmx/
	mkdir -p "${pkgdir}"/usr/share/nasmx/demos
	cp -a linux linux64 x11 "${pkgdir}"/usr/share/nasmx/demos
	cd ../inc
	cp -a nasmx.inc linux x11 gtk opengl "${pkgdir}"/usr/include/nasmx/
}
md5sums=('ba27c150fedc82e7d3a0c2cb619a2158')
