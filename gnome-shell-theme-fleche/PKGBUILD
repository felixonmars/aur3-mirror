# Maintainer: Mahmud Ridwan <m[at]hjr265[dot]me>
pkgname=gnome-shell-theme-fleche
pkgver=20140105
pkgrel=3
pkgdesc="A theme for GNOME Shell"
url="http://github.com/hdni/Fleche"
arch=('any')
license=('unknown')
depends=('gnome-shell>=3.6')
makedepends=('git')
source=($pkgname-$pkgver::'git://github.com/hdni/Fleche.git')
md5sums=('SKIP')

package() {
	mkdir -p "$pkgdir/usr/share/themes"
	cp -r "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/share/themes/Fleche"

	rm -r "$pkgdir/usr/share/themes/Fleche/"{firefox.css,fleche.crx,gtk-2.0,gtk-3.0,metacity-1}
}
