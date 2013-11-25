# Contributor: xavi <xavi@netsons.org>
pkgname=pacorder
pkgver=2.1
pkgrel=2
pkgdesc="a small script to list installed packages by required space"
arch=(i686 x86_64)
url="http://neogrigio.t15.org/"
license=('GPL')
groups=()
depends=()
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
install=
source=(pacorder)
noextract=()
md5sums=('a4f4f48b2ee98d97cc388462cef4f518')

build() {
	install -D -m775 $srcdir/pacorder $pkgdir/usr/bin/pacorder
}
