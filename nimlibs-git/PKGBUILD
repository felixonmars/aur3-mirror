pkgname=nimlibs-git
pkgver=84
pkgrel=1
pkgdesc="Miscellaneous libs/wrappers for Nimrod"
arch=(any)
url="https://github.com/fowlmouth/nimlibs"
license=("unknown")
makedepends=(git)
depends=(nimrod)
source=("${pkgname%-*}::git+https://github.com/fowlmouth/nimlibs.git")
md5sums=('SKIP')

pkgver () {
	cd "$srcdir/${pkgname%-*}"
	echo $(git rev-list --count master)
}

package() {
	cd "${srcdir}/${pkgname%-*}/fowltek"
	find . -name '*.nim' |
		xargs -rtl1 -I {} install -Dm644 {} "$pkgdir/usr/lib/nimrod/packages/nimlibs/"{}
}
