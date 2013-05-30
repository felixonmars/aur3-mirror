pkgname=jester-git
pkgver=38
pkgrel=1
pkgdesc="A sinatra-like web framework for Nimrod."
arch=(any)
url="https://github.com/dom96/jester"
license=("custom")
makedepends=(git)
depends=(nimrod)
source=("${pkgname%-*}::git+https://github.com/dom96/jester.git")
md5sums=('SKIP')

pkgver () {
	cd "$srcdir/${pkgname%-*}"
	echo $(git rev-list --count master)
}

package() {
	cd "${srcdir}/${pkgname%-*}"
	find . -name '*.nim' |
		xargs -rtl1 -I {} install -Dm644 {} "$pkgdir/usr/lib/nimrod/packages/jester/"{}
	rm -r "$pkgdir/usr/lib/nimrod/packages/jester/tests"
	install -Dm644 "license.txt" "$pkgdir/usr/share/licenses/jester/license.txt"
}
