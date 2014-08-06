# Maintainer: Steef435 <steef435 at hotmail dot com>

_pkgname="base16-shell"
pkgname="${_pkgname}-git"
pkgver=26
pkgrel=1
pkgdesc="Base16 colorscheme for Shells"
arch=("any")
url="https://github.com/chriskempson/$_pkgname"
license=("unknown")
makedepends=('git')
provides=("$_pkgname")
source=("git://github.com/chriskempson/$_pkgname.git")
md5sums=("SKIP")

pkgver() {
	cd "$srcdir/$_pkgname"
	git rev-list --count HEAD
}

package() {
	install -dm755 "$pkgdir/usr/share/$_pkgname"
	cd "$srcdir/$_pkgname/"
	install -m755 -t "$pkgdir/usr/share/$_pkgname" *.sh
}
