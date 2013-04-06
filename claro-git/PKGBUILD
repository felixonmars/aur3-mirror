pkgname=claro-git
pkgver=60f3e9b
pkgrel=1
pkgdesc="Cross platform GUI library with backends for Gtk+, Cocoa, and Win32"
arch=(i686 x86_64)
url="https://github.com/Araq/Claro"
license=("MPL")
depends=(gtk2)
makedepends=(git python2)
source=("${pkgname%-*}::git+https://github.com/Araq/Claro.git")
md5sums=('SKIP')

pkgver () {
	cd "$SRCDEST/${pkgname%-*}"
	echo "$(git describe --always | sed s/${_pkgname}-// | sed 's/-/./g')"
}

build() {
	cd "${srcdir}/${pkgname%-*}"
	sed -i -e 's/" -Werror"/""/' "koch.py"
	python2 koch.py claro
}

package() {
	cd "${srcdir}/${pkgname%-*}"
	install -Dm755 "build/libclaro.so" "$pkgdir/usr/lib/libclaro.so"
	mkdir -p "$pkgdir/usr/include/claro"
	cp -r include/* "$pkgdir/usr/include/claro"
}
