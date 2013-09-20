# Maintainer: Max Roder <maxroder@web.de>

pkgname='jondobrowser'
pkgver='0.10'
pkgrel='1'
_language='en-US'
pkgdesc='Firefox tweaked to work with jondo (anonymous browsing) (english version)'
url='https://anonymous-proxy-servers.net/en/jondobrowser.html'
arch=('x86_64' 'i686')
license=('GPL')
depends=('java-runtime')
optdepends=('zenity: simple dialog boxes'
			'kdialog: KDE dialog boxes'
			'notify-send: Gnome dialog boxes'
			'jondo: connection to jondo proxy cascades, gui version'
			'jondoconsole: connection to jondo proxy cascades, cli version')
install="${pkgname}.install"
source=("https://anonymous-proxy-servers.net/en/downloads/JonDoBrowser-${pkgver}-linux-${CARCH}-${_language}.tar.xz"
		"https://anonymous-proxy-servers.net/en/downloads/JonDoBrowser-${pkgver}-linux-${CARCH}-${_language}.tar.xz.asc"
		"jondobrowser.desktop")
if [[ "$CARCH" == 'x86_64' ]]; then
sha256sums=('f1a98e244ffd2c3df0b97619d39ebded30c1123c4a8a79f832fb01b65d10e363'
            'f221aea6174f519c78d022b8bb67608cd5aa3b28ebc46bbf9880b64902d83bea')
else
	sha256sums=('ebc967b33a23f05eb8c0486a9b7e0b454c74356d748fc71349b2e90429b55b70'
				'87640d2ff9cfa667d10e1fcac8d4b20d07a1cde305a7b4e0f5a2ddba42c1ad11')
fi
sha256sums+=('b7bbf376fd760e85102649166ed8710cceab88cf73b0425b67cb33be34d57749')

package() {
	cd "${srcdir}/JonDoBrowser/"

	install -Dm 644 ../${pkgname}.desktop	${pkgdir}/usr/share/applications/${pkgname}.desktop
	install -Dm 644 App/Firefox/icons/mozicon128.png	${pkgdir}/usr/share/pixmaps/${pkgname}.png
	install -Dm 755 start-jondobrowser.sh	${pkgdir}/usr/bin/${pkgname}
	install -Dm 644 CHANGELOG	${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG

	install -d	${pkgdir}/opt/JonDoBrowser
	cp -r App	${pkgdir}/opt/JonDoBrowser/
	cp -r Data	${pkgdir}/opt/JonDoBrowser/
	
}

# vim:set ts=2 sw=2 et:
