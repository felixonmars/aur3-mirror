# Maintainer: Niels Abspoel <aboe76 (at) Gmail (dot) com>

pkgname=python2-msgpack-pure
pkgver=0.1.3
pkgrel=1
pkgdesc="MessagePack (de)serializer written in pure Python" 
arch=('i686' 'x86_64')
url="http://msgpack.org/"
license=('mit')
depends=('python2' 'cython2' 'python2-distribute')
makedepends=('cython2')
provides=('python2-msgpack')
conflicts=('python2-msgpack-git')

source="http://pypi.python.org/packages/source/m/msgpack-pure/msgpack-pure-${pkgver}.tar.gz"

md5sums="4fc0fbb334db82b2079141034ccd91ae"

package() {
  cd ${srcdir}/msgpack-pure-${pkgver}
  python2 setup.py install --root=${pkgdir}/ --optimize=1
}
