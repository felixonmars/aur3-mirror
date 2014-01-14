# Maintainer: Mahmud Ridwan <m[at]hjr265[dot]me>
pkgname=fleche
pkgver=20140105
pkgrel=1
pkgdesc="A theme for GNOME Shell, GTK 3, Mutter"
url="http://github.com/hdni/Fleche"
arch=('any')
license=('unknown')
depends=('gtk3' 'gnome-shell>=3.6')
source=($pkgname-$pkgver::'git://github.com/hdni/Fleche.git')
md5sums=('SKIP')

package() {
	mkdir -p "$pkgdir/usr/share/themes"
	cp -r "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/share/themes/Fleche"

	rm "$pkgdir/usr/share/themes/Fleche/"{firefox.css,fleche.crx}
}
