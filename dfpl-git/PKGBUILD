# Maintainer: ian <ian at kremlin dot cc>
pkgname=dfpl-git
pkgver=0.0.0
pkgrel=1
pkgdesc="a powerleveler macro tool for dwarf fortress (adventure mode) [git version]"
arch=('any')
url="https://github.com/kremlin-/dfpl"
license=('GPL2')
groups=('system')
depends=('xdotool' 'bash')
optdepends=('dwarffortress: for obvious reasons')
conflicts=('dfpl')
source=("git://github.com/kremlin-/dfpl.git")
md5sums=('SKIP')
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/dfpl"
	git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/dfpl"
	cp dfpl.sh dfpl
	chmod +x dfpl
}

package() {
	cd "$srcdir/dfpl"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/man/man1"
	install -D "$srcdir/dfpl/dfpl" "$pkgdir/usr/bin"
	mv "./dfpl.man" "$pkgdir/usr/share/man/man1/dfpl.1"
	gzip "$pkgdir/usr/share/man/man1/dfpl.1"
}
