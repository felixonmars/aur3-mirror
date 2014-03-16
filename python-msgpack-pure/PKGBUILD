# Maintainer: Niels Abspoel <aboe76 (at) Gmail (dot) com>

pkgname=python-msgpack-pure
pkgver=0.1.3
pkgrel=1
pkgdesc="MessagePack (de)serializer written in pure Python" 
arch=('i686' 'x86_64')
url="http://msgpack.org/"
license=('mit')
depends=('python' 'cython' 'python-distribute')
makedepends=('cython')
provides=('python-msgpack')
conflicts=('python-msgpack-git')

source="http://pypi.python.org/packages/source/m/msgpack-pure/msgpack-pure-${pkgver}.tar.gz"

md5sums="4fc0fbb334db82b2079141034ccd91ae"

package() {
  cd ${srcdir}/msgpack-pure-${pkgver}
  python setup.py install --root=${pkgdir}/ --optimize=1
}
