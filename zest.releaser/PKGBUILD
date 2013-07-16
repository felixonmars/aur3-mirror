# Maintainer: palkeo < contact at palkeo _dot_ com >
pkgname=zest.releaser
pkgver=3.46
pkgrel=0
pkgdesc="Tool to help releasing python projects (manage version, pip uploads...)"
arch=('any')
url="https://pypi.python.org/pypi/zest.releaser"
license=('GPL')
depends=('python2')
source=("https://pypi.python.org/packages/source/z/$pkgname/$pkgname-$pkgver.zip")
md5sums=('03c58d2855ddeb80adb2c5720b4409b7')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
