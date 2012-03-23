# Maintainer: Scott Lawrence <bytbox@gmail.com>
pkgname=lanhep
pkgver=315
pkgrel=1
pkgdesc="Feynman rules generator"
arch=('i686' 'x86_64')
url="http://theory.sinp.msu.ru/~semenov/lanhep.html"
license=('custom')
depends=(glibc)
makedepends=(make gcc)
provides=()
conflicts=()
replaces=()
options=()
install=
changelog=
source=('http://theory.sinp.msu.ru/~semenov/lhep315.tgz'
	'http://theory.sinp.msu.ru/~semenov/licence')
md5sums=('cdd84731bd34e6b2b534dd560e02792a'
         'c58b4fd650094173ec1df891ed6fcd5f')

_ssdir=lanhep315

build() {
	cd $_ssdir
	make
}

package() {
	install -D  $_ssdir/lhep $pkgdir/usr/bin/lhep
	install -D licence $pkgdir/usr/share/licenses/$pkgname/LICENSE
	echo $pkgdir
}
