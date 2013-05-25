# Maintainer: Bartłomiej Bułat <bartek (dot) bulat (at) gmail (dot) com>
pkgname=deadbeef-gnome-mmkeys
pkgver=1.1
pkgrel=1
epoch=
pkgdesc="DeaDBeeF player Gnome (via DBus) multimedia keys plugin"
arch=(i386 x86_64)
url="https://github.com/barthez/deadbeef-gnome-mmkeys"
license=('GPL')
depends=(deadbeef glib2)
makedepends=(make git)
source=(deadbeef_gnome_mmkeys::git+https://github.com/barthez/deadbeef-gnome-mmkeys.git)
md5sums=('SKIP')

build() {
	cd "$srcdir/deadbeef_gnome_mmkeys"
	make
}

package() {
	cd "$srcdir/deadbeef_gnome_mmkeys"
	make ROOTDIR="$pkgdir/" install
}
