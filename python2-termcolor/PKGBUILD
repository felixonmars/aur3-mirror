# Maintainer: Tim Hatch <tim@timhatch.com>

_name=termcolor
pkgname=python2-$_name
pkgver=1.1.0
pkgrel=1
pkgdesc="ANSII Color formatting for output in terminal"
arch=('any')
license=('GPL')
url="http://pypi.python.org/pypi/termcolor"
depends=('python2' 'setuptools')
source=(http://pypi.python.org/packages/source/t/$_name/$_name-$pkgver.tar.gz)
md5sums=('043e89644f8909d462fbbfa511c768df')

build() {
	cd $srcdir/$_name-$pkgver

	python2 setup.py install --root=$pkgdir || return 1
}
