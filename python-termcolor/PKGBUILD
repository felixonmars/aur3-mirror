# Maintainer: Tim Hatch <tim@timhatch.com>

_name=termcolor
pkgname=python-$_name
pkgver=1.1.0
pkgrel=1
pkgdesc="ANSII Color formatting for output in terminal"
arch=('any')
license=('GPL')
url="http://pypi.python.org/pypi/termcolor"
depends=('python')
source=(http://pypi.python.org/packages/source/t/$_name/$_name-$pkgver.tar.gz)
conflicts=('python-termcolor')
replaces=('python-termcolor')
provides=('python-termcolor')
md5sums=('043e89644f8909d462fbbfa511c768df')

build() {
	cd $srcdir/$_name-$pkgver

	python setup.py install --root=$pkgdir || return 1
}
