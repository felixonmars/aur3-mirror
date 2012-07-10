# Maintainer: Jesus Jerez <jerezmoreno@gmail.com>
pkgname=jfsplit
pkgver=1.0.1
pkgrel=1
pkgdesc="File Splitter and Joiner"
arch=('any')
url="http://jfsplit.sourceforge.net"
license=('GPL3')
depends=('java-environment')
makedepends=('java-environment')
source=(
	"http://sourceforge.net/projects/jfsplit/files/Version 1.0.1/${pkgname}-1_0_1-jar.jar"
	"${pkgname}.desktop"
	"${pkgname}"
)
noextract=("${pkgname}-1_0_1-jar.jar")
md5sums=(
	'1dbc5b13f94649787a5a277d1e3a779e'
	'acc898410eb48e7ce9b0b28c73f2d92c'
	'b43e96813af25966cd4a50b6dca83f63'
)

package() {
	_dest="${pkgdir}/usr/share"
	_exec="${pkgdir}/usr/bin"
	
	install -dm755 "$_dest/${pkgname}"
	install -dm755 "$_dest/applications"
	install -dm755 "$_exec"
	
	install -D -m644  "${srcdir}/${pkgname}-1_0_1-jar.jar" "$_dest/${pkgname}/${pkgname}-1_0_1-jar.jar"
	install -D -m644  "${srcdir}/${pkgname}.desktop" "$_dest/applications/${pkgname}.desktop"
	install -D -m755  "${srcdir}/${pkgname}" "$_exec/${pkgname}"
}
