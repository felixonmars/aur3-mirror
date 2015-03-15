# Maintainer: Joel Almeida <aullidolunar at gmail dot c0m>

_theme='Hackneyed'
_keycode='165283'
pkgname=xcursor-hackneyed
pkgver=0.3.21.1
pkgrel=0
pkgdesc="Windows 3.x-inspired cursor theme with hourglasses (include left cursors)"
arch=('any')
url="http://xfce-look.org/content/show.php/Hackneyed?content=$_keycode"
license=('MIT/X11')
source=("http://xfce-look.org/CONTENT/content-files/$_keycode-$_theme-$pkgver-pack.tar.bz2")
md5sums=('3cac79af64eb7f29ef15a0496591f713')

package() {
	install -dm755 "$pkgdir/usr/share/icons/Hackneyed"
	cd "$srcdir/Hackneyed"
	cp -R . "$pkgdir/usr/share/icons/Hackneyed"
	install -dm755 "$pkgdir/usr/share/icons/LHackneyed"
	cd "$srcdir/LHackneyed"
	cp -R . "$pkgdir/usr/share/icons/LHackneyed"
}

build() {
	cd "$srcdir"
}
