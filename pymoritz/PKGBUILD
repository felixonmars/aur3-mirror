# Contributor: Mathias Fussenegger < f.mathias@zignar.net >
pkgname=pymoritz
pkgver=0.7.7
pkgrel=2
pkgdesc="simple vocab trainer (Leitner flashcard alike)"
arch=(i686 x86_64)
url="http://github.com/chobojordi/pymoritz/tree/master"
license="GPL"
depends=(python pygtk kiwi gettext python-sqlalchemy)
source=(http://zignar.net/static/files/$pkgname-$pkgver.tar.gz
	moritz)

build() {
	mkdir -p $startdir/pkg/usr/bin/
	cp moritz $startdir/pkg/usr/bin/
	cd $startdir/src/$pkgname-$pkgver
	mkdir -p $startdir/pkg/usr/share/$pkgname
	cp *.py *.glade license $startdir/pkg/usr/share/$pkgname
}
md5sums=('4ddbb294cff49abe4723383a8d341a26'
         '97b7d69d37001fdbf44b710478bf8d74')
