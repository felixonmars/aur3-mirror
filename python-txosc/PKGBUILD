# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=python-txosc
pkgver=0.2.0
pkgrel=1
pkgdesc="Open Sound Control (OSC) protocol for Twisted"
arch=(any)
url="http://tarballs.quessy.net/"
license=('GPL')
depends=('python2' 'twisted')
makedepends=('help2man')
source=("$url$pkgname-$pkgver.tar.gz")
md5sums=('523cee915f5f0fec651b85f446a45845')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # python2 fixes
  sed -i "s|env python|&2|" `grep -Erl "env python" .`

  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py install --root="$pkgdir"

  # Install examples
  install -d "$pkgdir/usr/share/$pkgname"
  cp -a examples "$pkgdir/usr/share/$pkgname"
}

# vim:set ts=2 sw=2 et:
