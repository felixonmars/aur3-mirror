# Contributor: Sphax <zecmerquise@gmail.com>
pkgname=plasmoid-toggle-compositing-svn
pkgver=847288
pkgrel=1
pkgdesc="A plasmoid to toggle KWin compositing"
arch=(i686 x86_64)
url="http://www.kde.org"
license="GPL"
depends=('kdelibs' 'kdebase-workspace')
makedepends=('cmake' 'gcc>=4.*' 'automoc4' 'subversion')
source=()
md5sums=()

_svntrunk="svn://anonsvn.kde.org/home/kde/trunk/playground/base/plasma/applets/toggle-compositing"
_svnmod="toggle-compositing"

build()
{
	cd $startdir/src
	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up)
	else
		svn co $_svntrunk --config-dir ./ $_svnmod
	fi

	msg "SVN checkout done or server timeout"

	if [ -d $_svnmod-build ]; then
		rm -rf $_svnmod-build
	fi
	cp -r $_svnmod $_svnmod-build

	cd $_svnmod-build
	# Fix to install correctly the svg file
	patch -Np0 -i $startdir/cmakelists.patch || return 1
	mv images/onoff_switch.svg.old images/onoff_switch.svg

	mkdir cmake-build
	cd cmake-build
	cmake ../ \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release || return 1
	make || return 1
	make DESTDIR=$startdir/pkg install || return 1
}

