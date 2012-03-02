# Maintainer: Myles English <myles at rockhead dot biz>
pkgname=ufl
pkgver=1.0.0
pkgrel=1
pkgdesc="Unified form language."
arch=(any)
url="http://launchpad.net/ufl"
license=('GPL')
groups=('fenics')
depends=('python2')
options=(!emptydirs)
source=($url/1.0.x/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('5996ee68b1b75cb258213735a1297e51')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  find ${srcdir} -name "*" -type f -exec \
      sed -i 's#\(/usr/bin/env \|/usr/bin/\)python[2-3]*#\1python2#' {} \;
  python2 setup.py install --prefix=/usr --root="$pkgdir"
}
