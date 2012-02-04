# Contributor: David Moore <davidm@sjsoft.com>

pkgname=python-wsgiutils
pkgver=0.7
pkgrel=2
pkgdesc="WSGI Utils are a collection of useful libraries for use in a WSGI environnment."
depends=('python' 'setuptools')
source=("http://pypi.python.org/packages/source/W/WSGIUtils/WSGIUtils-$pkgver.tar.gz")
url="http://www.owlfish.com/software/wsgiutils/index.html"
license='MIT'
arch=('i686' 'x86_64')
md5sums=('80656ce771bb33eb8ad502c3b674b1fc')

build() {
	cd $srcdir/WSGIUtils-${pkgver}
	python2 setup.py install --root=$pkgdir
}

