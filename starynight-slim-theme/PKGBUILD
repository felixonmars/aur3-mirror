pkgname=starynight-slim-theme
pkgver=1.0
pkgrel=1
pkgdesc="A theme with a moon and stars"
url="http://sgtconker1r.deviantart.com/art/StaryNight-SLiM-Theme-390104948"
arch=("any")
license=("GPL2")
depends=("slim")
source=("http://fc02.deviantart.net/fs71/f/2013/213/2/d/starynight___slim_theme_by_sgtconker1r-d6g9awk.zip")
md5sums=("0aa6b517d8ed3a3117e73304d273ff67")
_theme="StaryNight"

build() {
	cd "$srcdir"
}

package() {
	cd "$srcdir/$_theme"
	install -dm755 "$pkgdir/usr/share/slim/themes/$_theme"
	install -Dm644 "background.png" "$pkgdir/usr/share/slim/themes/$_theme"
	install -Dm644 "panel.png" "$pkgdir/usr/share/slim/themes/$_theme"
	install -Dm644 "slim.theme" "$pkgdir/usr/share/slim/themes/$_theme"
}