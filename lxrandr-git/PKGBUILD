# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=lxrandr
pkgname=$_pkgname-git
pkgver=312.0b94cb8
pkgrel=1
pkgdesc="standard screen manager of LXDE"
arch=("i686" "x86_64")
url="http://www.lxde.org"
license=("GPL")
depends=("gtk2" "menu-cache" "xorg-server-utils")
makedepends=("git" "intltool" "pkgconfig" "autoconf" "perl" "gtk-doc")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git://git.lxde.org/git/lxde/$_pkgname.git")
sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/$_pkgname"
	echo "$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
	cd "$srcdir/$_pkgname"
	./autogen.sh
	./configure --prefix=/usr --sysconfdir=/etc --enable-man
	make
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir" install
}
