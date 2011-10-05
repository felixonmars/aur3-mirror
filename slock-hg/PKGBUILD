# Contributor: Byron Clark <byron@theclarkfamily.name>
pkgname=slock-hg
pkgver=42
pkgrel=1
pkgdesc="A simple screen locker for X"
arch=('i686' 'x86_64')
url="http://www.suckless.org/wiki/tools/xlib"
license=('MIT')
depends=('libx11')
makedepends=('mercurial')
provides=('slock')
conflicts=('slock')

_hgroot=http://hg.suckless.org/
_hgrepo=slock

build() {
	cd $srcdir
	msg "Connecting to Mercurial server...."

	if [ -d $_hgrepo ]; then
		cd $_hgrepo
		hg pull -u
		msg "The local files are updated."
	else
		hg clone $_hgroot $_hgrepo
	fi

	msg "Mercurial checkout done or server timeout"
	msg "Starting make..."

	rm -rf $srcdir/$_hgrepo-build
	cp -r $srcdir/$_hgrepo $srcdir/$_hgrepo-build
	cd $srcdir/$_hgrepo-build

	make || return 1
	make PREFIX=/usr DESTDIR=$pkgdir install || return 1
	install -m644 -D LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
