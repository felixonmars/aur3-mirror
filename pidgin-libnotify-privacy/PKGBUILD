# Maintainer: Ivan de Jesús Pompa García <ivan.pompa@gmx.com>

pkgname=pidgin-libnotify-privacy
pkgver=0.14
pkgrel=1
pkgdesc="pidgin plugin that enables popups when someone logs in or messages you(with privacy)."
arch=('i686' 'x86_64')
url="http://gaim-libnotify.sourceforge.net/"
license=('GPL')

depends=('pidgin'
		'libnotify'
		'perlxml'
		'gettext'
		'notification-daemon')

makedepends=('intltool')

conflicts=('pidgin-libnotify')
provides=('pidgin-libnotify')

source=("http://garr.dl.sourceforge.net/project/gaim-libnotify/pidgin-libnotify/pidgin-libnotify-0.14/pidgin-libnotify-0.14.tar.gz"
	"fix-privacy-pidgin-libnotify.c.patch")

md5sums=("bfb5368b69c02d429b2b17c00a6673c0"
	"607582c9d7a967f0d6d4faa6205f9908")


build() {
	cp fix-privacy-pidgin-libnotify.c.patch $srcdir/pidgin-libnotify-$pkgver
	cd $srcdir/pidgin-libnotify-$pkgver
	patch -Np1 < fix-privacy-pidgin-libnotify.c.patch
	cd $srcdir/pidgin-libnotify-$pkgver
	./configure --prefix=/usr || return 1
	cd $srcdir/pidgin-libnotify-$pkgver/po
	make update-po
	cd $srcdir/pidgin-libnotify-$pkgver
	make
	make DESTDIR=$pkgdir install
	rm $pkgdir/usr/lib/purple-2/pidgin-libnotify.a
	rm $pkgdir/usr/lib/purple-2/pidgin-libnotify.la
}
