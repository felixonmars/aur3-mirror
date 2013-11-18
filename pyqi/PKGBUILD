# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=pyqi
pkgver=0.2.0
pkgrel=1
pkgdesc="Python framework designed to support wrapping general commands"
arch=('any')
url="http://bipy.github.io/pyqi/doc/index.html"
license=('BSD')
depends=('python2')
options=(!emptydirs)
source=("ftp://thebeast.colorado.edu/pub/pyqi-releases/pyqi-${pkgver}.tar.gz")
md5sums=('49577ba321290f12bd23e1b2cf584256')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 COPYING.txt "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
