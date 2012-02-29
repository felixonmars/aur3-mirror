##
# Maintainer: Todd Harbour <aur @AT@ quadronyx .DOT. org>
# Comments: 
# Binary version available from: http://www.quadronyx.org/aur/
##

pkgname=lcdgen
pkgver=1.00
pkgrel=2
pkgdesc="A generator for creating screenshots of (text) LCD displays, supporting different colours, (character) dimensions and scales)"
url="http://avtanski.net/projects/lcd/"
arch=('any')
license=('unknown')
depends=(
	'jdk'
)
source=(
	"http://avtanski.net/projects/lcd/${pkgname}.jar"
	"${pkgname}.sh"
)
md5sums=(
	'18a9421f371efaed30a1b36097112578'
	'95af86dcb6df457ea5e7b36062a9e6b6'
)

build() {
	cd "${startdir}/src/"

    install -Dm755 -o root -g root "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

	mkdir -p "${pkgdir}/opt/${pkgname}"

	install -Dm644 -o root -g root "${pkgname}.jar" "${pkgdir}/opt/${pkgname}/"
}
