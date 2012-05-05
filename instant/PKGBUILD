# Maintainer: Myles English <myles at rockhead dot biz>
# Contributor: DarkHeart <fumbles@ymail.com>
pkgname=instant
pkgver=1.0.0
pkgrel=2
pkgdesc="A Python module allowing for instant inlining of C and C++ code in Python"
arch=('any')
url="http://launchpad.net/instant"
license=('BSD')
groups=('fenics')
depends=('python2' 'swig')
conflicts=('instant')
source=(http://launchpad.net/instant/1.0.x/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('b73ffae5f590eeaaf4682e32a44b36cc')

build() {
  cd $srcdir/$pkgname-$pkgver

  find ${srcdir} -name "*" -type f -exec \
      sed -i 's#\(/usr/bin/env \|/usr/bin/\)python[2-3]*#\1python2#' {} \;

  find ${srcdir} -name "*" -type f -exec \
      sed -i '/-python /! {s/python /python2 /}' {} \;

  python2 setup.py build
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}

# vim:set ts=2 sw=2 et:
