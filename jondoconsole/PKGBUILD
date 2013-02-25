# Maintainer: Max Roder <maxroder@web.de>

pkgname='jondoconsole'
pkgver='00.00.151'
pkgrel='2'
pkgdesc='Redirects internet traffic trough a mix of proxy servers to hide the origin of the requests. CLI version.'
arch=('any')
license=('BSD')
url='https://anonymous-proxy-servers.net/'
depends=('java-environment')
install="${pkgname}.install"
source=('https://anonymous-proxy-servers.net/downloads/JonDoConsole.jar'
		'https://anonymous-proxy-servers.net/downloads/JonDoConsole.jar.asc'
		'jondoconsole'
		'licence')
noextract=("JonDoConsole.jar")
sha256sums=('1b13abe594da1eeec1c51c87702d9a913aa40a1b7eb0aac237e8e9b813944efe'
            'f4696cd627a8f8b252f2714e958681a31b04e2f751d9126d13968abf2c7d9d27'
            '954afad6b06569465b0ed682638fc12c7c699da4b94eaf7fa450686e8909083e'
            '9c7de55f80fd78ef6f8d39fa0309defbc42ac848c2c9f5a995901326a1a43e8d')

package() {
	cd $srcdir

	install -Dm755 $pkgname	${pkgdir}/usr/bin/${pkgname}
	install -Dm644 JonDoConsole.jar	${pkgdir}/usr/share/java/${pkgname}/JonDoConsole.jar
	install -Dm644 licence	${pkgdir}/usr/share/licenses/${pkgname}/LICENCE
}

# vim:set ts=2 sw=2 et:

