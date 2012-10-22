# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname='envirobear2000'
pkgver=0
pkgrel=3
pkgdesc="A game where you play as a bear who must fatten up to prepare for a long winter hibernation."
arch=('any')
url="http://gamejolt.com/games/action/enviro-bear-2000/211/"
license=('unknown')
depends=('wine')
source=(
	"http://gamejolt.com/data/games/211/files/EnviroBear2000.zip"
	'envirobear2000'
	'envirobear2000.png'
	'envirobear2000.desktop'
)
md5sums=(
	'7b14bc7d80552dcbedc2eceaa6e91b70'
	'ece58a0c28fd2941556d12b7e27b0758'
	'2499828bc511defeb6173be771050545'
	'07396b4b9aa8be2cf49160911a5e01b2'
)

package() {
	mkdir "$pkgdir/opt"
	cp -r "$srcdir/EnviroBear2000" "$pkgdir/opt"

	install -Dm 644 "$srcdir/envirobear2000.desktop" "$pkgdir/usr/share/applications/envirobear2000.desktop"
	install -Dm 644 "$srcdir/envirobear2000.png" "$pkgdir/usr/share/pixmaps/envirobear2000.png"
	install -D "$srcdir/envirobear2000" "$pkgdir/usr/bin/envirobear2000"
}
