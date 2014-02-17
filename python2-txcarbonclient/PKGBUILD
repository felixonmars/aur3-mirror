# Maintainer: Adam Wolk <netprobe at gmail dot com>
_name=txCarbonClient
pkgname=python2-txcarbonclient
pkgver=0.1
pkgrel=1
pkgdesc="A simple Twisted client for reporting metrics to Carbon."
arch=('any')
url="https://github.com/fdChasm/txCarbonClient"
license=('MIT')
depends=('python2' 'twisted')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/t/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('20dca556d3ff3aedcc368faa3b564dda')

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root=${pkgdir} --optimize=1
}
