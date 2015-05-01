pkgname=ttf-ruhr-uni-bochum
pkgver=2015.04.30
pkgrel=1
pkgdesc="Corporate design fonts of the Ruhr University Bochum"
url="https://www.ruhr-uni-bochum.de/cd/"
license=('custom')
arch=(any)
depends=(fontconfig xorg-font-utils)
source=('https://LoginID:Passwort@www.ruhr-uni-bochum.de/pressestelle/cd/fonts/RUB-Corporate-Design-Fonts.zip'
	'https://LoginID:Passwort@www.ruhr-uni-bochum.de/cdfonts/Lizenzbedingungen-RUBFlama.pdf'
	'https://LoginID:Passwort@www.ruhr-uni-bochum.de/cdfonts/Lizenzbedingungen-RUBScala.pdf')
install=$pkgname.install
sha256sums=('33ecdf32c6f85fefa4baeab69b2e45f1572d357fe1b8a0582e2441072d6b0c61'
	'39c569b35008527ef62d5808dfef83d6e56c95ce731c7b51ae3684bbc84a3df1'
	'5dcc49e2de13481709d8b16fa54c54633518735ac1129fe7617902f09bca8588')

package() {
	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -m644 "${srcdir}/Lizenzbedingungen-RUBFlama.pdf" "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -m644 "${srcdir}/Lizenzbedingungen-RUBScala.pdf" "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -m644 "${srcdir}/RUB-Corporate-Design-Fonts/README" "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -d "$pkgdir/usr/share/fonts/TTF"
	install -m644 "${srcdir}/RUB-Corporate-Design-Fonts/"*.ttf "${pkgdir}/usr/share/fonts/TTF/"
}
