# Contributor: Oliver Mader <dotb52@gmail.com>

arch=(i686 x86_64)
pkgname=qinfo-svn
pkgver=3
pkgrel=1
pkgdesc="A tiny but strong ascii art text viewer written in C using GTK+."
url="http://b52.mine.nu/qinfo/"
license=('GPL')
depends=('gtk2')
provides=('qinfo')
conflicts=('qinfo')
makedepends=('subversion')
install=qinfo.install
source=()
md5sums=()

_svntrunk=svn://b52.mine.nu/qinfo/trunk
_svnmod=qinfo

build() {
	cd $startdir/src

	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up -r $pkgver)
	else
		svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi
	
	msg "SVN checkout done or server timeout"
	msg "Starting make..."
	
	cp -r $_svnmod $_svnmod-build
	cd $_svnmod-build
	
	./configure --prefix=/usr || return 1
	make || return 1
	make DESTDIR=$startdir/pkg/ install || return 1
	
	rm -rf $startdir/src/$_svnmod-build
}
