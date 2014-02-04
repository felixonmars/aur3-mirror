# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=pencilbox
pkgver=1.6.4
_sfver=60445
pkgrel=1
pkgdesc="A simple java-based pencil puzzle editor (22 puzzles from Puzzle Communication Nikoli)"
arch=('any')
url="http://pencilbox.sourceforge.jp/"
license=('GPL')
depends=('java-environment' 'sh')
source=("http://iij.dl.sourceforge.jp/pencilbox/${_sfver}/pencilbox-${pkgver}.zip" "${pkgname}.sh")

package() {
	mkdir "${pkgdir}/usr"
	mkdir "${pkgdir}/usr/share"
	mkdir "${pkgdir}/usr/share/java/"
	mkdir "${pkgdir}/usr/share/java/${pkgname}"
	mkdir "${pkgdir}/usr/share/${pkgname}"
	mkdir "${pkgdir}/usr/share/doc"
	mkdir "${pkgdir}/usr/share/doc/${pkgname}"

	cd "${srcdir}"
	install -Dm644 *.jar "${pkgdir}/usr/share/java/${pkgname}"
	install -Dm755 ${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"
	cp -r sample "${pkgdir}/usr/share/${pkgname}"
	install -Dm644 *.html *.txt *.css "${pkgdir}/usr/share/doc/${pkgname}"
}

md5sums=('09e3b4234f47c5a8e9187abd7ba67752'
         'b4fab6e374d9534f3c3fe105560f69ee')
