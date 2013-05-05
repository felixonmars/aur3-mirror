# Maintainer: rslzaro <addres at domain dot com >

pkgname=emsa2edf
pkgver=11
pkgrel=1
pkgdesc="Conversor de PLG para EDF+"
arch=(i686 x86_64)
url="http://www.teuniz.net/emsa2edf/"
license=('GPL')
depends=('make')
install="$pkgname.install"
source=("${url}${pkgname}_ver${pkgver}_source.tar.gz")
md5sums=('464ab0108b1640b108197fbbc80bf91c')

build() {
	cd ${srcdir}/${pkgname}_ver${pkgver/.}_source
	sh ./build.sh
}

package() {
cd ${srcdir}/${pkgname}_ver${pkgver/.}_source

	# bin
   	install -Dm755 $pkgname \
   	"$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:

