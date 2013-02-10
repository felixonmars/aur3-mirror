# Maintainer: Army
pkgname=xkcd-dl
pkgver=0.2
pkgrel=2
pkgdesc="a script to download all xkcd comics"
arch=(any)
depends=('bash' 'imagemagick' 'bc')
url="http://seba-geek.de"
license=(custom:"beer- || pizzaware")
source=(http://seba-geek.de/media/stuff/xkcd-dl.sh)

build() {
	/bin/true
}

package() {
	install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
md5sums=('0dcf83e2db22ef97b5850995d6c14fae')
