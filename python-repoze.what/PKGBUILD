# contributor: DasIch <dasdasich@googlemail.com>
_name=repoze.what
pkgname=python-$_name
pkgver=1.0.8
pkgrel=1
pkgdesc="Authorization framework for WSGI applications"
arch=('i686' 'x86_64')
license=('BSD' 'custom')
url="http://static.repoze.org/whatdocs/"
depends=('python' 'setuptools' 'python-repoze.who' 'python-paste')
source=(http://pypi.python.org/packages/source/r/$_name/$_name-$pkgver.tar.gz)
conflicts=('repoze.what')
replaces=('repoze.what')
md5sums=('2e9659f4d23711f41017cd4a26d76848')

build() {
	cd "${srcdir}/${_name}-${pkgver}"

	python setup.py install --root="${pkgdir}" || return 1
}
