# Maintainer: Lara Maia <lara@craft.net.br>
pkgname=fretscpp-songs
pkgver=20120315
url=http://code.google.com/p/fretscpp/
pkgrel=3
pkgdesc="Songs for your fretscpp"
arch=('any')
license=('CCPL')
depends=('fretscpp')
provides=('fretscpp-songs')
source=('http://lara.craft.net.br/fretscpp-songs.tar.gz')
md5sums=('0d3ef879fbec1b3f71a17832957fcef3')

package() {
	install -dm755 "${pkgdir}"/usr/share/games/fretscpp/data/songs/
	
	cp -rf "${srcdir}"/${pkgname}/armygeddon/              "${pkgdir}"/usr/share/games/fretscpp/data/songs/
	cp -rf "${srcdir}"/${pkgname}/chaos_god/               "${pkgdir}"/usr/share/games/fretscpp/data/songs/
	cp -rf "${srcdir}"/${pkgname}/Escape\ from\ chaosland/ "${pkgdir}"/usr/share/games/fretscpp/data/songs/
	cp -rf "${srcdir}"/${pkgname}/Feelings/                "${pkgdir}"/usr/share/games/fretscpp/data/songs/
	cp -rf "${srcdir}"/${pkgname}/internal_degeneration/   "${pkgdir}"/usr/share/games/fretscpp/data/songs/
	cp -rf "${srcdir}"/${pkgname}/Metal\ madness/          "${pkgdir}"/usr/share/games/fretscpp/data/songs/
	cp -rf "${srcdir}"/${pkgname}/mutilated_mime/          "${pkgdir}"/usr/share/games/fretscpp/data/songs/
	cp -rf "${srcdir}"/${pkgname}/War\ of\ freedom/        "${pkgdir}"/usr/share/games/fretscpp/data/songs/
}





