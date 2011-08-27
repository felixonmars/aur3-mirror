# Maintainer:  Jonathan Wiersma <archaur at jonw dot org>
arch=(i686 x86_64)
pkgname=pycompiz-svn
pkgver=3
pkgrel=2
pkgdesc="Python module for controlling compiz through DBus"
url="http://code.google.com/p/pycompiz"
license=('GPL2')

#if [ ! -z `pacman -Qqs "^compiz-git$"` ]; then
#	depends=('compiz-git' 'dbus-python')
#else
	depends=('compiz-core' 'dbus-python')
#fi
makedepends=('subversion')
conflicts=('pycompiz')
provides=('pycompiz')

source=()
md5sums=()

_svntrunk=http://pycompiz.googlecode.com/svn/trunk
_svnmod=pycompiz-read-only

build() {
	cd $srcdir || return 1

	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up -r $pkgver) || return 1
	else
		svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	rm -rf $_svnmod-build
	cp -r $_svnmod $_svnmod-build || return 1
	cd $_svnmod-build/pyCompiz || return 1
	
	python setup.py install --root=${pkgdir} || return 1

	rm -rf $srcdir/$_svnmod-build || return 1
}
# vim:syntax=sh
