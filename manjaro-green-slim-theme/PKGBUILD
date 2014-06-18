pkgname=manjaro-green-slim-theme
pkgver=1.0
pkgrel=1
pkgdesc="Green theme matching Manjaro artwork"
url="http://culinax.deviantart.com/art/Manjaro-Green-SLiM-Theme-348268939"
arch=("any")
license=("GPL")
depends=("slim")
source=("http://fc05.deviantart.net/fs71/f/2013/013/9/d/manjaro_green_slim_theme_by_culinax-d5rcm17.zip")
md5sums=("44eb298d9265551dafa5ea5ea9bd1f12")
_theme="manjaro-green"

build() {
	cd "$srcdir"
}

package() {
	cd "$srcdir/$_theme"
	install -dm755 "$pkgdir/usr/share/slim/themes/$_theme"
	install -Dm644 "background.jpg" "$pkgdir/usr/share/slim/themes/$_theme"
	install -Dm644 "panel.png" "$pkgdir/usr/share/slim/themes/$_theme"
	install -Dm644 "slim.theme" "$pkgdir/usr/share/slim/themes/$_theme"
}