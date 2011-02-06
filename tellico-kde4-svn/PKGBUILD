# Contributor: Rasi <rasi@xssn.at>
pkgname=tellico-kde4-svn
pkgver=1034259
pkgrel=1
pkgdesc="A collection manager for KDE 4.x"
arch=("i686" "x86_64")
url="http://periapsis.org/tellico/"
license=("GPL2")
depends=('qt' 'libxml2' 'libxslt' 'taglib' 'kdemultimedia-kioslave' 'kdepimlibs' 'yaz' 'python')
makedepends=("cmake" "automoc4")
provides=("tellico")
conflicts=("tellico")
source=()
md5sums=()

_svntrunk="svn://anonsvn.kde.org/home/kde/trunk/extragear/office/tellico/"
_svnmod="tellico"

build() {
	cd $srcdir

	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up -r $pkgver)
	else
		svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	mkdir -p $_svnmod-build
	cd $_svnmod-build

	unset QTDIR QMAKESPEC
	cmake -DCMAKE_INSTALL_PREFIX=/usr ../$_svnmod
	make || return 1
	make DESTDIR=$pkgdir install
}
