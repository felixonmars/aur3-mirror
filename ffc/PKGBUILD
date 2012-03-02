# Maintainer: Myles English <myles at rockhead dot biz>
pkgname=ffc
pkgver=1.0.0
pkgrel=1
pkgdesc="A compiler for finite element variational forms."
arch=(any)
url="http://launchpad.net/ffc"
license=('GPL')
groups=('fenics')
depends=('python2' 'fiat' 'ufc' 'ufl' 'python2-numpy')
optdepends=('FErari: optimisation support')
options=(!emptydirs)
source=($url/1.0.x/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('e4838b6eb2a53ba6e0082644e74570aa')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  find ${srcdir} -name "*" -type f -exec \
      sed -i 's#\(/usr/bin/env \|/usr/bin/\)python[2-3]*#\1python2#' {} \;
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
