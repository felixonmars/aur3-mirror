# Contributor: Joel Almeida <aullidolunar at gmail dot c0m>

pkgname=gucharmap-gtk2
pkgver=3.0.1
pkgrel=1
pkgdesc="Gnome Unicode Charmap (gtk2 version and without gconf)"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Apps/Gucharmap"
license=('GPL3')
depends=('gtk2' 'libxml2')
makedepends=('intltool')
source=("http://ftp.gnome.org/pub/GNOME/sources/gucharmap/3.0/gucharmap-$pkgver.tar.bz2")
md5sums=('754e1bc0ff7c190a8e8d855b2ca4ba16')
conflicts=('gucharmap')
provides=('gucharmap')

build() {
	cd "$srcdir/gucharmap-$pkgver"
	./configure --prefix=/usr --with-gtk="2.0" --disable-gconf
	make
}

package() {
	cd "$srcdir/gucharmap-$pkgver"
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	make DESTDIR="$pkgdir" install
}
