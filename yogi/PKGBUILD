# Contributor: GnunuX <gnunux chez laposte point net>
pkgname=yogi
pkgver="0.1"
pkgrel=3
pkgdesc="A GTK based graphical front end to the image corrector clens."
arch=('i686' 'x86_64')
url="http://yogi.nongnu.org/"
license="GPL"
depends=('gtk2' 'libglade' 'gconf' 'clens')
install=yogi.install
source=(http://download.savannah.nongnu.org/releases/yogi/$pkgname-$pkgver.tar.bz2)
md5sums=('e110a17d0c9f15f01c1b5ff197a8687b')

build() {
	cd $srcdir/$pkgname-$pkgver/
	./configure --prefix=/usr/
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver/
	make DESTDIR=$pkgdir GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 install
	install -Dm 755 $pkgname.schemas $pkgdir/usr/share/gconf/schemas/$pkgname.schemas
	rm -R $pkgdir/usr/etc
}
