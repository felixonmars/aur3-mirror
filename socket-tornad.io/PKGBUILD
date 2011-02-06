pkgname=socket-tornad.io
pkgver=0.1.3
pkgrel=2
pkgdesc='SocketTornad.IO is a Python implementation of the Socket.IO protocol for the Tornado webserver/framework.'
arch=('any')
url="http://github.com/SocketTornadIO/SocketTornad.IO"
license=('Apache')
depends=('python2>=2.6' 'python-cli>=1.1.1' 'python-simplejson>=2.1.0' 'python-tornado>=1.1' 'python-beaker>=1.5.3')
makedepends=('setuptools')
source=(http://opensource.errorcode420.com/SocketTornad.IO/SocketTornad.IO-$pkgver.tar.gz)
md5sums=('58563590e68994941140cca8db5b82f9')

build() {
  cd SocketTornad.IO-$pkgver

  # replace /usr/bin/env python with python2
  find . -name '*.py' -exec sed -i -e '1 s/python\s*$/python2/' {} \;

  python2 ./setup.py install --root=$pkgdir --prefix=/usr || return 1
}
