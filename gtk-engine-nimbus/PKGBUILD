# Maintainer: Denis Bryzgalov <admin@flashadmin.org>
# Contributor: Joel Almeida <aullidolunar at gmail dot c0m>

pkgname=gtk-engine-nimbus
pkgver=0.1.7
pkgrel=1
pkgdesc="Nimbus Gtk2 engine and theme"
arch=('i686' 'x86_64')
url="https://launchpad.net/~merlwiz79/+archive/ubuntu/nimbus"
license=('GPL')
options=(!libtool)
depends=('gtk2')
conflicts=('nimbus')
makedepends=('intltool' 'icon-naming-utils')
source=("https://launchpad.net/~merlwiz79/+archive/ubuntu/nimbus/+files/nimbus_$pkgver.orig.tar.gz")
md5sums=('a2ccbaba3fc164b105e3aad3216f2a58')

build() {
	cd "$srcdir/nimbus-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/nimbus-$pkgver"
	make DESTDIR="$pkgdir" install
}
