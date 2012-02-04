# Maintainer: SpepS <dreamspepser at yahoo dot it>
# Contributor: arjan <arjan@archlinux.org>
# Contributor orelien <aurelien.foret@wanadoo.fr>

pkgname=python-numeric
pkgver=24.2
pkgrel=5
pkgdesc="Numerical Python adds a fast array facility to the Python language"
arch=(i686 x86_64)
url="http://numeric.scipy.org/"
license=('custom')
depends=('python2')
source=(http://downloads.sourceforge.net/sourceforge/numpy/Numeric-$pkgver.tar.gz)
md5sums=('2ae672656e06716a149acb048cca3093')

build() {

  cd "$srcdir/Numeric-$pkgver"

  # Python2 fix
  sed \
	-e "s_\(env python\).*_\12_" \
	-e "s_\(bin/python\).*_\12_" \
	-i `grep -rlE "(env python|bin/python)" .`
}

package() {

  cd "$srcdir/Numeric-$pkgver"

  # Install
  python2 setup.py install --prefix=/usr --root="$pkgdir/"
  install -D -m644 Legal.htm "$pkgdir/usr/share/licenses/$pkgname/Legal.htm"
}
