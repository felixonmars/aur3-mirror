# Maintainer: Thorsten Tasch <tht@thorstentasch.de>
pkgname=kdbedit
pkgver=0.5.4
pkgrel=1
pkgdesc="A GUI to edit Elektra Key Database, based on QT"
url="http://elektra.sourceforge.net/"
license="GPL"
depends=('elektra>=0.6' 'qt')
install=kdbedit.install
source=(http://dl.sourceforge.net/sourceforge/elektra/$pkgname-$pkgver.tar.gz)
md5sums=('98387a94f0329730a64f01d4dc5b3344')

build() {
	cd $startdir/src/$pkgname
	qmake || return 1
	make || return 1

	mkdir -p $startdir/pkg/usr/bin
	cp src/kdbedit $startdir/pkg/usr/bin
	find icons | grep -v .svn | grep \.png | cpio -pdvm $startdir/pkg/usr/share/lib/kdbedit
	#mkdir -p $startdir/pkg/usr/share/applications/
	#cp kdbedit.desktop $startdir/pkg/usr/share/applications/
}
