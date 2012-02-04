# Maintainer: Adrià Arrufat <swiftscythe@gmail.com>

pkgname=kid3-svn
pkgver=668
pkgrel=1
pkgdesc="An MP3, Ogg/Vorbis and FLAC tag editor for KDE."
arch=('i686' 'x86_64')
url="http://kid3.sourceforge.net/"
license=('GPL')
depends=('id3lib' 'tunepimp' 'taglib' 'kdelibs' 'qt')
provides=('kid3')
conflicts=('kid3')
makedepends=('automoc4' 'cmake')
source=()

md5sums=()

_svntrunk=https://kid3.svn.sourceforge.net/svnroot/kid3/trunk/kid3
_svnmod=kid3

build() {
	cd $startdir/src

	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up -r $pkgver)
	else
		svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	svn export $_svnmod $_svnmod-build
	cd $_svnmod-build

	cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DWITH_MP4V2=OFF
	make || return 1
	make DESTDIR=$startdir/pkg/ install

	rm -rf $startdir/src/$_svnmod-build
}
