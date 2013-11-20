#Contributor: Christer Edwards <christer.edwards@gmail.com> 

pkgname=python2-msgpack
pkgver=0.4.0
pkgrel=1
pkgdesc="Python module for MessagePack serialization/deserialization library" 
arch=('i686' 'x86_64' 'armv6h')
url="https://github.com/msgpack/msgpack-python"
license=('mit')
depends=('python2' 'cython2' 'python2-distribute')
makedepends=('cython2')
provides=('python2-msgpack')
conflicts=('python2-msgpack-git')

source="http://pypi.python.org/packages/source/m/msgpack-python/msgpack-python-${pkgver}.tar.gz"

md5sums="8b9ce43619fd1428bf7baddf57e38d1a"

build() {
  cd ${srcdir}/msgpack-python-${pkgver}
  python2 setup.py install --root=${pkgdir}/ --optimize=1
}
