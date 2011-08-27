# Contributor: Doaa <dan.cpp@gmail.com>
pkgname=gfourcc
pkgver=0.1.1
pkgrel=1
pkgdesc="Gtk avi format fourcc modifier"
arch=('i686' 'x86_64')
url="http://sarovar.org/projects/gfourcc/"
license=('GPL')
source=(http://sarovar.org/frs/download.php/611/gfourcc-0.1.1.tar.bz2 pixmapfix.diff gfourcc.desktop)
md5sums=('4dd4117ff71290eed05dd23aa6c827a4' '9613a239e10dacacabf9fa4d3021fba9' 'fd40640933d725dbe2ae1b16004eda64')
depends=(gtk2)

build() {
	cd "$srcdir/$pkgname-$pkgver"
	patch "./src/main.c" < "$startdir/pixmapfix.diff"
	./configure --prefix=/usr/
	make
	install -D -m755 ./src/gfourcc $startdir/pkg/usr/bin/gfourcc
	install -D -m644 ./pixmaps/gfourcc.png $startdir/pkg/usr/share/pixmaps/gfourcc.png
	install -D -m644 $startdir/gfourcc.desktop $startdir/pkg/usr/share/applications/gfourcc.desktop
}
