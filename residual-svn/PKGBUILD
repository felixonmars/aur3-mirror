# Contributor: henning mueller <henning@orgizm.net>
pkgname=residual-svn
pkgver=1664
pkgrel=1
pkgdesc="Residual is a ScummVM sub-project to play LucasArts' LUA-based 3D adventures, such as Grim Fandango."
url="http://residual.sourceforge.net"
arch=(i686 x86_64)
license=(GPL)
depends=(sdl libmad mesa fluidsynth)
makedepends=(subversion)
install=$pkgname.install
source=()
md5sums=()

_svntrunk=http://residual.svn.sourceforge.net/svnroot/residual/residual/trunk
_svnmod=residual

build() {
	cd $srcdir

	[ -d $_svnmod/.svn ] &&
		(cd $_svnmod && svn up -r $pkgver) ||
		svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod

	cp -r $_svnmod $_svnmod-build
	cd $_svnmod-build

	./configure --prefix=/usr || return 1
	sed -i 's/TODO""/TODO" "/' ports.mk

	make || return 1
	make DESTDIR=$pkgdir install

	rm -rf $srcdir/$_svnmod-build
}
