# Maintainer: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

pkgname=eqsl
pkgver=201212241900
pkgrel=1
pkgdesc="The official EQSL users list"
arch=('any')
url="http://www.eqsl.cc/"
license=('CCPL:by')
source=(http://hams.co.ua/download/AGMemberList_${pkgver}.txt.gz)

package() {
	cd "$srcdir"

	install -Dm644 "$srcdir"/AGMemberList_${pkgver}.txt "$pkgdir"/usr/share/${pkgname}/AGMemberList.txt
}

md5sums=('f0407475ea436dfa10f97f8ad07176e7')
sha256sums=('20518bb6b61fc5f85316f13d8b52e695963d04b8460b5d1ce1ab955eb6bbc2ae')
