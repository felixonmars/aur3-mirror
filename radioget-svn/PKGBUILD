# Maintainer: osily <ly50247 at gmail dot com>

pkgname=radioget-svn
pkgver=30
pkgrel=1
pkgdesc='A simple radio.'
arch=('i686' 'x86_64')
url='https://code.google.com/p/radioget/'
license=('GPL3')
groups=()
provides=()
depends=('qt' 'mplayer')
makedepends=('subversion')

_svnmod="radioget"
_svntrunk="http://radioget.googlecode.com/svn/trunk/"

build() {
	svn co $_svntrunk $_svnmod
	cd $srcdir 
	msg "SVN checkout done or server timeout"
	cd $_svnmod
	qmake && make || return 1
	mkdir -p "$pkgdir/usr/bin/" || return 1
	install -D -m755 radioget $pkgdir/usr/bin || return 1
}

