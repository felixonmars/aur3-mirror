# Maintainer: Thorsten Weimann <thorsten.weimann@gmx.net>

pkgname=python2-dip-snapshot
pkgver=0.3_dc1c5e94a3f3
_ver="0.3-snapshot-dc1c5e94a3f3"
pkgrel=1
pkgdesc="Application development and integration framework for Python and PyQt."
arch=(any)
url="http://www.riverbankcomputing.co.uk/software/dip/download"
license=('GPL')
depends=('pyqt')
source=(http://www.riverbankcomputing.co.uk/static/Downloads/dip/dip-py2-gpl-${_ver}.tar.gz)
md5sums=('3acdc92c36148acbc2a6515510a7a5f1')

build() {
	cd "$srcdir/dip-py2-gpl-$_ver"
	python2 setup.py install --root=$pkgdir/ || return 1
}

