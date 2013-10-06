# Maintainer: John Reese <john@noswap.com>
# Upstream URL: https://github.com/jreese/ircstat
#
# For improvements/fixes to this package, please send a pull request:
# https://github.com/jreese/arch


pkgname=ircstat
pkgver=0.1.1
pkgrel=3
pkgdesc="generate statistics and graphs from IRC channel logs"
arch=('any')
url="https://github.com/jreese/ircstat"
license=('MIT')
depends=('python-setuptools' 'python-matplotlib')
makedepends=('git')

source=("https://pypi.python.org/packages/source/i/ircstat/ircstat-${pkgver}.tar.gz")
md5sums=('731a31e55d530a93286b542af9b3c159')

package() {
  cd "$srcdir/ircstat-$pkgver"
  python setup.py install --root="$pkgdir/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
