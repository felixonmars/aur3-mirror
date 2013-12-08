# Maintainer: Adam Wolk <netprobe at gmail dot com>
_name=txJSON-RPC
pkgname=python2-txjson-rpc
pkgver=0.3.1
pkgrel=1
pkgdesc="Code for creating Twisted JSON-RPC servers and clients"
arch=('any')
url="http://launchpad.net/txjsonrpc"
license=('MIT')
depends=('python2' 'python2-simplejson' 'twisted')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/t/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('b9b9e59d1bad30ef15b38a99aa4b3c6e')

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root=${pkgdir} --optimize=1
}
