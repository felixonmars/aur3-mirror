pkgname=nael-git
pkgver=a30f0b2
pkgrel=1
pkgdesc="Stack-based language similar to Factor."
arch=(i686 x86_64)
url="https://github.com/dom96/nael"
license=("BSD")
makedepends=(nimrod)
source=("${pkgname%-*}::git+https://github.com/dom96/nael.git")
md5sums=('SKIP')

pkgver () {
	cd "$SRCDEST/${pkgname%-*}"
	echo "$(git describe --always | sed s/${_pkgname}-// | sed 's/-/./g')"
}

build() {
	cd "${srcdir}/${pkgname%-*}/src"
	nimrod c -d:release main.nim
}

package() {
	cd "${srcdir}/${pkgname%-*}/src"
	mkdir -p "$pkgdir/usr/lib/nael/lib"
	mkdir -p "$pkgdir/usr/bin"
	cp "lib/"* "$pkgdir/usr/lib/nael/lib"
	install -Dm755 "main" "$pkgdir/usr/lib/nael/main"
	install -m644 "system.nael" "$pkgdir/usr/lib/nael/system.nael"
	install -Dm644 "../license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
	ln -s "/usr/lib/nael/main" "$pkgdir/usr/bin/nael"
} 
