# Contributor: bountykiller <masse.nicolas@gmail.com>
# Maintainer: Vinicius de Avila <vinicius.avila.jorge@gmail.com>
pkgname=pango-dfb
pkgrealname=pango
pkgver=1.29.4
pkgrel=1
pkgdesc="pango library compiled with directfb backend"
arch=(i686 x86_64)
url="http://www.pango.org/"
license=('GPL')
depends=('directfb' 'pixman>=0.12' 'glib2>=2.30' )
source=(http://ftp.gnome.org/pub/GNOME/sources/pango/1.29/$pkgrealname-$pkgver.tar.xz)
md5sums=('9d5aba73897d2e8e8115b3f4fddbc0af')

install=${pkgname}.install
build () {
	export PREFIX=/opt/gtkdfb
	export LD_LIBRARY_PATH=$PREFIX/lib
	export PKG_CONFIG_PATH=$LD_LIBRARY_PATH/pkgconfig
	cd $startdir/src/$pkgrealname-$pkgver/
	./configure --prefix=$PREFIX --without-x
	make
	make DESTDIR=$startdir/pkg install
}
