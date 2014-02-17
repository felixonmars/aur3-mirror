# Maintainer: Adam Wolk <netprobe at gmail dot com>
_name=txStatsD
pkgname=python2-txstatsd
pkgver=1.0.0
pkgrel=1
pkgdesc="A network daemon for aggregating statistics. Twisted-based implementation of a statsd-compatible server and client."
arch=('any')
url="https://launchpad.net/txstatsd"
license=('MIT')
depends=('python2' 'twisted')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/t/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('13e66d412ec9b5f43c82cce4cdd010f5')

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root=${pkgdir} --optimize=1
}
