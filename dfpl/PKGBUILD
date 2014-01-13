# Maintainer: ian <ian at kremlin dot cc>
pkgname=dfpl
pkgver=0.1
pkgrel=1
pkgdesc="a powerleveler macro tool for dwarf fortress (adventure mode)"
arch=('any')
url="http://aur.archlinux.org/packages/dfpl"
license=('GPL2')
groups=('system')
depends=('xdotool' 'bash')
optdepends=('dwarffortress: for obvious reasons')
conflicts=('dfpl-git')
source=("$pkgname-$pkgver.tar.gz")
md5sums=('64f8006c997d0d7fd7840fb49b2889ad')
sha256sums=('b9a2ac4ea5e4b7bdc4a98a558b1cf41c912f498cec1f5d3b107a86087169cfeb')
sha512sums=('52a77ce06596a552112044740bbd4b77d3d724d406f6155579261aeeef3b961c56aa53f5576c34c0880b442dab79a1be2173ab658ec7423edb838e2fd9f6ea7b')

prepare() {
	cd "$srcdir"
	cp dfpl.sh dfpl
	chmod +x dfpl
}

package() {
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/man/man1"
	install -D "$srcdir/dfpl" "$pkgdir/usr/bin"
	mv "./dfpl.man" "$pkgdir/usr/share/man/man1/dfpl.1"
	gzip "$pkgdir/usr/share/man/man1/dfpl.1"
}
