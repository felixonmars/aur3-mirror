# Contributor: GnunuX <gnunux chez laposte point net>
pkgname=goupil
pkgver="0.1.0"
pkgrel=2
pkgdesc="An association membership management tool for the GNOME environment."
url="http://goupil.tuxfamily.org/"
license="GPL"
depends=('libglademm' 'gnome-vfsmm' 'sqlite3')

source=(http://goupil.tuxfamily.org/downloads/goupil-$pkgver.tar.gz)
md5sums=('38f338340731b729cde6e8a0afc9ea71')

build() {
	cd $startdir/src/goupil-$pkgver/
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=$startdir/pkg install
}

