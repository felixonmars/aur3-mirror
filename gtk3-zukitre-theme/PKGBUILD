# Maintainer: Joel Almeida <aullidolunar at gmail dot c0m>

pkgname=gtk3-zukitre-theme
pkgver=0.9
pkgrel=2
pkgdesc="A theme based on the work of Zuki team (xfwm4, metacity, gtk2 and gtk3 support)"
arch=('any')
url="https://github.com/lassekongo83/zuki-themes/tree/master/Zukitre"
license=('GPL')
depends=('gtk-engines' 'gtk-engine-unico' 'gtk-engine-murrine')
makedepends=('git')

package() {
	git clone "https://github.com/lassekongo83/zuki-themes.git"
	cd "$srcdir/zuki-themes/Zukitre"
	install -d -m 755 "$pkgdir/usr/share/themes/Zukitre"
	find . -type f -exec install -D -m 644 '{}' "$pkgdir/usr/share/themes/Zukitre/{}" \;
	install -d -m 755 "$pkgdir/usr/share/licenses/$pkgname"
	install -D -m 644 "$srcdir/zuki-themes/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

build() {
	cd "$srcdir"
}
