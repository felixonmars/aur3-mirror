# Contributor: Kevin van Andel <actreon at gmail dot com>
pkgname=trac-0.11-accountmanagerplugin
pkgver=7731
pkgrel=1
pkgdesc="User account management plugin for Trac 0.11"
arch=('i686' 'x86_64')
url="http://trac-hacks.org/wiki/AccountManagerPlugin" 
license="THE BEER-WARE LICENSE"
makedepends=("python>=2.5" "setuptools")
depends=("python>=2.5" "trac>=0.11")
install=trac-0.11-accountmanagerplugin.install
source=()
md5sums=()

_svntrunk="http://trac-hacks.org/svn/accountmanagerplugin/0.11"
_svnmod="accountmanagerplugin"

build() {
	cd ${srcdir}

	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up -r $pkgver)
	else
		svn co http://trac-hacks.org/svn/accountmanagerplugin/0.11 -r $pkgver $_svnmod
	fi

	cd ${srcdir}/${_svnmod}
	python setup.py build || return 1
	python setup.py install --root=${pkgdir} || return 1
}
