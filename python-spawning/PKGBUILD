# Contributor: David Moore <davidm@sjsoft.com>

pkgname=python-spawning
pkgver=0.9.5
pkgrel=1
pkgdesc="A wsgi server which supports multiple processes, multiple threads, green threads, non-blocking HTTP io, and automatic graceful upgrading of code."
depends=('python' 'setuptools' 'python-eventlet')
source=("http://pypi.python.org/packages/source/S/Spawning/Spawning-$pkgver.tar.gz")
url="http://github.com/rtyler/Spawning/"
license='MIT'
arch=('i686' 'x86_64')
md5sums=('85ae3628829657095df2b171e86b32f6')

build() {
	cd $srcdir/Spawning-${pkgver}
	python2 setup.py install --root=$pkgdir
}

