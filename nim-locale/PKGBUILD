pkgname=nim-locale
pkgver=3
pkgrel=1
pkgdesc="A simple I18N module for Nimrod."
arch=(any)
url="https://github.com/Amrykid/nim-locale"
license=("unknown")
makedepends=(git)
depends=(nimrod)
source=("${pkgname%-*}::git+https://github.com/Amrykid/nim-locale.git")
md5sums=('SKIP')

pkgver () {
	cd "$srcdir/${pkgname%-*}"
	echo $(git rev-list --count master)
}

package() {
	cd "${srcdir}/${pkgname%-*}"
	install -Dm644 locale.nim "$pkgdir/usr/lib/nimrod/packages/nim-locale/locale.nim"
}
