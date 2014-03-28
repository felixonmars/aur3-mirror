# Maintainer: Bruno Galeotti bgaleotti at gmail dot com>

pkgname=python2-ngxtop
pkgver=0.0.1
pkgrel=1
pkgdesc="Real-time metrics for nginx server"
arch=('any')
url='https://pypi.python.org/pypi/ngxtop'
license=('MIT')
depends=('python2' 'python2-docopt'  'python2-tabulate')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/n/ngxtop/ngxtop-$pkgver.tar.gz")
sha256sums=('c0665429e6d31b3fbc5b43d470d85f7d86721862f34b467400363097829c74b0')

package() {
  cd "$srcdir/ngxtop-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
