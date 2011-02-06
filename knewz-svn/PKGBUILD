# Contributor: Lawrence Lee <valheru AT facticius DOT net>
pkgname=knewz-svn
pkgver=112
pkgrel=1
pkgdesc="Binary newsgroup client for KDE4"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/knewz/"
license=('GPL')
depends=('kdelibs4' 'uudeview')
makedepends=('cmake>=2.4' 'subversion')
conflicts=(knewz)
provides=(knewz)
source=()
md5sums=()
_svntrunk=https://knewz.svn.sourceforge.net/svnroot/knewz/trunk
_svnmod=knewz

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
	cmake $startdir/src/$_svnmod
	make DESTDIR="$startdir/pkg" install

	rm -rf $startdir/src/$_svnmod-build
}

# vim:set ts=2 sw=2 et:
