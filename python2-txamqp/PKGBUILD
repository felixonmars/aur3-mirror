# Maintainer: Anthony Uk <uk@dataway.ch>
pkgname=python2-txamqp
pkgver=0.6.1
pkgrel=1
pkgdesc="Python library for communicating with AMQP peers and brokers using Twisted"
arch=('any')
url="https://launchpad.net/txamqp"
license=('APACHE')
depends=('python2' 'twisted')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/t/txAMQP/txAMQP-$pkgver.tar.gz")
md5sums=('c082f994d00fca5f3664c80827bf2622')

package() {
  cd "$srcdir/txAMQP-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
