# Maintainer: Andrej "qwp0" Tokarcik <androsis@gmail.com>

pkgname=eazysvn-svn
pkgver=30
pkgrel=1
pkgdesc="Set of Python scripts which make work with Subversion easier"
url="http://mg.pov.lt/eazysvn/"
depends=('python' 'subversion')
conflicts=('eazysvn')
provides=('eazysvn')
makedepends=()
arch=('i686' 'x86_64')
license=('GPL')
source=()
md5sums=()

_svntrunk=http://mg.pov.lt/eazysvn/svn
_svnmod=eazysvn
_revnumber=$pkgver

build() {
	cd $startdir/src

	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up -r $pkgver)
	else
		svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi

	msg "SVN checkout done or the server timed out"
  msg "Starting 'python setup.py install'..."

	cp -r $_svnmod $_svnmod-build
	cd $_svnmod-build

	msg "Starting make..."

	python ./setup.py install --root=$startdir/pkg || return 1

	rm -rf $startdir/src/$_svnmod-build
}
