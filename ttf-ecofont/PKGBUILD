# Maintainer: Sarkasper <echo a2FzcGVyLm1lbnRlbkBnbXguY29tCg==|base64 -d>
# Contributor: Mark Smith <markzzzsmith@yahoo.com.au>
pkgname=ttf-ecofont
pkgver=2.03
pkgrel=3
pkgdesc="Ecologically friendly font for printed documents (saves ink!)"
arch=('any')
url="http://www.ecofont.eu/"
license=('custom')
depends=(fontconfig xorg-fonts-encodings xorg-font-utils)
install=$pkgname.install
source=(http://www.ecofont.eu/assets/files/spranq_eco_sans_regular.zip
	http://www.ecofont.eu/assets/files/Ecofont_licence.pdf
	$pkgname.install)
md5sums=('2af5318735606f5dd8cfa45faffe8eb6'
	 'f14318ffddafcacb99fcbd83b3ecb9e7'
	 '1ef3a2484dbee25eb72e222939705f6e')

package() {

	cd "$srcdir/"

	mkdir -p "${pkgdir}/usr/share/fonts/TTF"
	install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF/"

	mkdir -p "${pkgdir}/usr/share/licenses/custom/$pkgname"
	install -m644 Ecofont_licence.pdf \
		"${pkgdir}/usr/share/licenses/custom/$pkgname/license.pdf"

}
