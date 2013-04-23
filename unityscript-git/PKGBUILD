pkgname=unityscript-git
pkgver=59351c9
pkgrel=1
pkgdesc="A JavaScript implementation based on the Boo programming language."
arch=(i686 x86_64)
license=("custom")
depends=(mono)
makedepends=(nant git)
conflicts=(unityscript)
provides=(unityscript)
url="https://github.com/bamboo/unityscript"
source=("${pkgname%-*}::git+https://github.com/bamboo/unityscript.git"
"boo::git+https://github.com/bamboo/boo.git"
"us.sh")
md5sums=(SKIP SKIP 'eea1b49b3cdd603094885d0993bf7bfc')

pkgver () {
	cd "$srcdir/${pkgname%-*}"
	echo "$(git describe --always | sed s/${_pkgname}-// | sed 's/-/./g')"
}

build() {
	cd "${srcdir}/boo"
	nant
	cd "../${pkgname%-*}"
	nant
	cd bin
	rm "nunit.framework.dll"
	rm "UnityScript.Tests"*
}

package() {
	cd "${srcdir}/${pkgname%-*}/bin"
	find . -name '*.dll' -o -name '*.mdb' -o -name '*.exe' |
		xargs -rtl1 -I {} install -Dm644 {} "$pkgdir/usr/lib/unityscript/"{}
	install -Dm755 "$srcdir/us.sh" "$pkgdir/usr/bin/us"
	install -Dm644 "${srcdir}/${pkgname%-*}/LICENSE" "$pkgdir/usr/share/licenses/unityscript/LICENSE"
	find "$pkgdir/usr/lib/unityscript/" -name '*.dll' -o -name '*.exe' | xargs -rtl1 mono --aot
}
