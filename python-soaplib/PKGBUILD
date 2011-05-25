# Contributor: David Moore <davidm@sjsoft.com>

pkgname=python-soaplib
pkgver=2.0.0_beta2
_pkgver=2.0.0-beta2
pkgrel=1
pkgdesc="A simple library for writing soap web services"
depends=('python2' 'setuptools')
source=("http://pypi.python.org/packages/source/s/soaplib/soaplib-$_pkgver.tar.gz")
url="http://soaplib.github.com/soaplib/2_0/"
license='LGPL'
arch=('i686' 'x86_64')
md5sums=('2f2ef88b08c6d392dd7f12be6e6d1352')

build() {
	cd $srcdir/soaplib-${_pkgver}
	python2 setup.py install --root=$pkgdir
}

md5sums=('294bc8db05011bfa14e00a6a9368e2ae')
