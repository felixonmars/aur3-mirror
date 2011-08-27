# Contributor: Marc Poiroud <marci1 AT archlinux.fr>
pkgname=itest
_pkgname=iTest
pkgver=1.4.0
pkgrel=1
pkgdesc="Server and Client designed for easy computerised examination."
arch=(i686 x86_64)
url="http://itest.sourceforge.net/"
license=('GPL')
depends=('qt')
source=(http://dl.sourceforge.net/sourceforge/itest/$_pkgname-$pkgver-src.tar.gz \
	itestserver.desktop itestclient.desktop)
md5sums=('924c681bb522d8b2972683d0d421b8f3'
         'fd430af858cd7eca0c80ac1f5a6cdc7d'
         '19416b55cff21921ab14491f0d5feab4')

build() {
	cd $startdir/src/$_pkgname-$pkgver-src
# Server
	cd $startdir/src/$_pkgname-$pkgver-src/iTestServer
	lrelease iTestServer.pro
	qmake -config release || return 1
	cd ..
# Client
	cd $startdir/src/$_pkgname-$pkgver-src/iTestClient
	lrelease iTestClient.pro
	qmake -config release || return 1
	cd ..
	qmake -config release
	make || return 1

# install binaries
	install -D -m755 $startdir/src/$_pkgname-$pkgver-src/bin/iTestServer \
			$startdir/pkg/usr/bin/iTestServer
	install -D -m755 $startdir/src/$_pkgname-$pkgver-src/bin/iTestClient \
			$startdir/pkg/usr/bin/iTestClient
# install pixmap
	install -D -m644 $startdir/src/$_pkgname-$pkgver-src/itdb.png \
			$startdir/pkg/usr/share/pixmaps/itestserver.png
	install -D -m644 $startdir/src/$_pkgname-$pkgver-src/itest.png \
			$startdir/pkg/usr/share/pixmaps/itestclient.png
# install desktop files
	install -D -m644 $startdir/src/itestserver.desktop \
			$startdir/pkg/usr/share/applications/itestserver.desktop
	install -D -m644 $startdir/src/itestclient.desktop \
			$startdir/pkg/usr/share/applications/itestclient.desktop
}
