# Contributor: Sphax <zecmerquise@gmail.com>
pkgname=plasmoid-news-svn
pkgver=851741
pkgrel=1
pkgdesc="A plasmoid to display news from various sources"
arch=(i686 x86_64)
url="http://www.kde.org"
license="GPL"
depends=('kdelibs' 'kdebase-workspace')
makedepends=('cmake' 'gcc>=4.*' 'automoc4' 'subversion')
source=()
md5sums=()

_svntrunk="svn://anonsvn.kde.org/home/kde/trunk/playground/base/plasma/applets/news"
_svnmod="news"

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
	# Fix to prevent cmake to fail
	patch -Np0 -i $startdir/cmakelists.patch || return 1
	# Fix a call to Plasma::Theme::ButtonBackgroundColor
	# Apparently it doesn't exist in KDE 4.1, only in 4.2
	patch -Np0 -i $startdir/plasma_theme_buttonbackgroundcolor.patch || return 1

	mkdir cmake-build
	cd cmake-build
	cmake ../ \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release || return 1
	make || return 1
	make DESTDIR=$startdir/pkg install || return 1
}

