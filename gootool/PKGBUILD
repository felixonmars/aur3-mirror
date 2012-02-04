# Contributor: Matthew Bauer <mjbauer95@gmail.com>

pkgname=gootool
pkgver=1.0.3.441
pkgrel=4
pkgdesc="World of Goo hacking utility (worldofgoo)"
arch=(any)
url="http://goofans.com/download/utility/$pkgname"
license=('custom')
source=(http://goofans.com/download/145/1254/$pkgname-$pkgver-linux.tar.bz2
	application-x-goomod.xml
	gootool.desktop)
depends=('java-runtime')
optdepends=("worldofgoo: if you don't already have the game")
md5sums=('0b20ce256fbf6440659457ac1c5611cd'
	'a2d4a46c158e5c80bf4ac10b43b4100d'
	'0461706a2a607fe39b701d3ccbc67b0f')


build() {
	return 0
}

package() {
	install -D -m644 "${srcdir}/application-x-goomod.xml" "${pkgdir}/usr/share/mime/packages/application-x-goomod.xml"
	install -D -m644 "${srcdir}/gootool.desktop" "${pkgdir}/usr/share/applications/gootool.desktop"
	mkdir -p ${pkgdir}/usr
	cp -r ${srcdir}/${pkgname}-${pkgver}/* ${pkgdir}/usr
}

