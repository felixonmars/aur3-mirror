# contributor: DasIch <dasdasich@googlemail.com>
_name=repoze.tm2
pkgname=python2-$_name
pkgver=1.0
_pkgver=1.0b1
pkgrel=1
pkgdesc="A tiny LRU cache implementation and decorator"
arch=('i686' 'x86_64')
license=('BSD' 'custom')
url="http://pypi.python.org/pypi/repoze.tm2"
depends=('python2', 'python-transaction')
makedepends=('setuptools')
source=(http://pypi.python.org/packages/source/r/$_name/$_name-$_pkgver.tar.gz)
md5sums=('a89757ac1e5403b5097eee26252f9977')

build() {
	cd "${srcdir}/${_name}-${_pkgver}"

	python2 setup.py install --root="${pkgdir}" || return 1
}
