# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: DasIch <dasdasich@googlemail.com>

_name=argscript
pkgbase=python-$_name
pkgname=("python-$_name" "python2-$_name")
pkgver=0.5
pkgrel=1
pkgdesc="Simple but powerful sys.argv parser"
arch=('any')
license=('BSD')
url="https://github.com/hoffmann/argscript"
makedepends=('python-setuptools' 'python2-setuptools')
source=(http://pypi.python.org/packages/source/a/$_name/$_name-$pkgver.tar.gz)
md5sums=('564d9a42ba2cfc96e6ed10e541657b68')


package_python-argscript() {
	depends=(python)

	cd $srcdir/$_name-$pkgver

	python setup.py install --root=$pkgdir
}

package_python2-argscript() {
	depends=(python2)

	cd $srcdir/$_name-$pkgver

	python2 setup.py install --root=$pkgdir
}
