# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=python2-numeric
pkgver=24.2
pkgrel=5
pkgdesc="Python module for high-performance, numeric computing."
arch=(any)
url="http://people.csail.mit.edu/jrennie/python/numeric/"
license=('custom')
depends=('python2')
source=(http://downloads.sourceforge.net/sourceforge/numpy/Numeric-$pkgver.tar.gz)
md5sums=('2ae672656e06716a149acb048cca3093')

build() {
  cd "$srcdir/Numeric-$pkgver"

  sed -e "s_\(env python\).*_\12_" -e "s_\(bin/python\).*_\12_" -i `grep -rlE "(env python|bin/python)" .`
}

package() {
  cd "$srcdir/Numeric-$pkgver"

  python2 setup.py install --prefix=/usr --root="$pkgdir/"
  install -D -m644 Legal.htm "$pkgdir/usr/share/licenses/$pkgname/legal.htm"
}
