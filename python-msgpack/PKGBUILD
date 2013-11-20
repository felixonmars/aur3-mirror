#Contributor: Christer Edwards <christer.edwards@gmail.com> 

pkgname=python-msgpack
pkgver=0.4.0
pkgrel=1
pkgdesc="Python module for MessagePack serialization/deserialization library" 
arch=('i686' 'x86_64')
url="https://github.com/msgpack/msgpack-python"
license=('mit')
depends=('python' 'cython' 'python-distribute')
makedepends=('cython')
provides=('python-msgpack')
conflicts=('python-msgpack-git')

source="http://pypi.python.org/packages/source/m/msgpack-python/msgpack-python-${pkgver}.tar.gz"

md5sums="8b9ce43619fd1428bf7baddf57e38d1a"

build() {
  cd ${srcdir}/msgpack-python-${pkgver}
  python setup.py install --root=${pkgdir}/ --optimize=1
}
