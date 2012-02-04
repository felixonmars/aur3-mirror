# Contributor: Fazlul Shahriar <fshahriar@gmail.com>
pkgname=django-coverage
pkgver=1.2.2
pkgrel=1
pkgdesc="A tool for measuring code coverage of Python programs."
arch=('any')
url="http://pypi.python.org/pypi/django-coverage"
license=('BSD')
depends=('python2' 'python2-coverage')
makedepends=('setuptools')
source=("http://pypi.python.org/packages/source/d/${pkgname}/${pkgname}-$pkgver.tar.gz")

build() {
	cd "$srcdir/${pkgname}-$pkgver"
	python2 setup.py install --root=$pkgdir
}
md5sums=('71823dc6eb3327d323f089ceee84a288')
