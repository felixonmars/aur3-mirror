# Maintainer: Myles English <myles at rockhead dot biz>
pkgname=fiat
pkgver=1.0.0
pkgrel=3
pkgdesc="Supports generation of arbitrary order instances of the Lagrange elements on lines, triangles, and tetrahedra."
arch=(any)
url="http://launchpad.net/fiat"
license=('GPL')
groups=('fenics')
depends=('python2') #'scons' 'python2-scientificpython'
options=(!emptydirs)
source=($url/1.0.x/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('fcbad66fb59a07b716e072a15fc51bb5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  find ${srcdir} -name "*" -type f -exec \
      sed -i 's#\(/usr/bin/env \|/usr/bin/\)python[2-3]*#\1python2#' {} \;
  python2 setup.py install --prefix=/usr --root="$pkgdir"
}
