# Maintainer: Troy Cox <troy.cox@rackspace.com>

pkgname=python2-rax_networks_python_novaclient_ext
pkgver=0.1
pkgrel=0
pkgdesc="Adds rackspace networks support to python-novaclient."
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/rax_networks_python_novaclient_ext/0.1"
license=('GPL')
depends=('python2' 'python2-novaclient' 'python2-httplib2' 'python2-prettytable' 'python-simplejson' 'python2-iso8601')
makedepends=('python2')
provides=("pythonrax_networks_python_novaclient_ext=$pkgver")
source=(http://pypi.python.org/packages/source/r/rax_networks_python_novaclient_ext/rax_networks_python_novaclient_ext-${pkgver}.tar.gz)
md5sums=('018d3a6367f2137c5f999a0a023049de')

build() {
  cd "$srcdir/rax_networks_python_novaclient_ext-$pkgver"
  python2 setup.py build || return 1
  python2 setup.py install --root=${pkgdir} || return 1
}
