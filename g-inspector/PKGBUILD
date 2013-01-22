# Maintainer: Victor Aurélio <victor.feradecs@gmail.com>
pkgname=g-inspector
_pkgname=ginspector
pkgver=20050529
pkgrel=1
pkgdesc="is a GLib(GTK+) object/class inspector."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/g-inspector/"
license=('BSD')
depends=('gtk2' 'glrr' 'glrr-widgets' 'gdk-pixbuf2')
source=(${pkgname}-${pkgver}.tar.bz2::http://sourceforge.net/projects/g-inspector/files/latest/download)
md5sums=('0a8474e0d90b139b1baa70b097a4fd51')

build() {
	cd "$srcdir/${_pkgname}-$pkgver"

	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${_pkgname}-$pkgver"

	make DESTDIR="$pkgdir/" install
}
