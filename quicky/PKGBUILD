# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=quicky
pkgver=0.4
pkgrel=2
pkgdesc="A simple note-taking application with Wiki-style syntax and behaviour."
arch=('i686')
url="http://qt-apps.org/content/show.php/Quicky?content=80325"
license=('GPL')
depends=('qt')
source=(http://qt-apps.org/CONTENT/content-files/80325-quicky-0.4.tar.gz)
md5sums=('824d9e477ee9c4994f73a3cb215161d9')

build() {
	cd $startdir/src/$pkgname-$pkgver
	mkdir -p $pkgdir/usr/{share/quicky,bin}
	qmake || return 1
	make || return 1
	install -D -m755 quicky $pkgdir/usr/bin/quicky
	install -D -m644 $startdir/quicky.desktop $pkgdir/usr/share/applications/quicky.desktop
}
