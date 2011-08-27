# Contributor: Panagiotis Papadopoulos
pkgname=knfoviewer-svn
pkgver=154
pkgrel=1
pkgdesc="NFO File Viewer for KDE – KDE4 Version"
arch=('i686' 'x86_64')
url="http://knfoviewer.googlecode.com"
license=('GPL')
depends=('kdelibs')
source=()
md5sums=()
_svntrunk=http://knfoviewer.googlecode.com/svn/trunk/
_svnmod=knfoviewer

build() {
  cd $srcdir

	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up -r $pkgver)
	else
		svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ../$_svnmod
	make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
