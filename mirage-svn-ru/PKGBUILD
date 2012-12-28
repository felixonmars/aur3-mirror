# Maintainer: Konstantin Krasavin <konstantin.hard@gmail.com>

pkgname=mirage-svn-ru
pkgver=392
pkgrel=1
pkgdesc="A simple GTK+ Image Viewer (Russian SVN Version)"
arch=('i686' 'x86_64')
url="http://mirageiv.berlios.de/"
license=('GPL')
depends=('pygtk')
optdepends=('pyexiv2: for reading of Exif data on filetypes supported by exiv2')
makedepends=('subversion')
conflicts=('mirage' 'mirage-svn')
provides=('mirage')
source=()
install=$pkgname.install
md5sums=()

_svntrunk=http://svn.berlios.de/svnroot/repos/mirageiv/trunk
_svnmod=mirage

build() {
	cd $srcdir

	# Get Latest Source Code
	svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	msg "SVN checkout done or server timeout"
	# Get Latest Russian ru.po file
	cd $srcdir/mirage/po
	msg "Connecting to server..."
	wget -O ru.po http://dl.dropbox.com/u/75612439/ru.po
	msg "All is done..."
	cd $srcdir
	# Install
	cd $_svnmod
	python2 setup.py install --root=$pkgdir
}
