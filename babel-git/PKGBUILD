# Maintainer: Erik Johansson Andersson <exetoc@gmail.com>
pkgname=babel-git
pkgver=132
pkgrel=2
pkgdesc="Package manager for the Nimrod programming language."
arch=(i686 x86_64)
url="https://github.com/nimrod-code/babel"
license=("BSD")
depends=(glibc)
makedepends=(nimrod-git)
source=("$pkgname::git+https://github.com/nimrod-code/babel.git")
md5sums=('SKIP')

pkgver () {
	cd "$srcdir/$pkgname"
	echo $(git rev-list --count master)
}

build() {
	cd "$srcdir/$pkgname/src/"
	nimrod c -d:release babel.nim
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 "src/babel" "$pkgdir/usr/bin/babel"
	install -Dm644 "license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
