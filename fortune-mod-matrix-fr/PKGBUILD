# Maintainer: wido <widomaker2k7@gmail.com>:
pkgname=fortune-mod-matrix-fr
pkgver=20091207
pkgrel=1
pkgdesc="Fortune cookies: Matrix in french."
arch=('any')
license=('CCPL')
depends=(fortune-mod)
source=('matrix')
url="http://fr.wikiquote.org/wiki/Matrix"
md5sums=('9c17dcaf08a2e30ce93afc94a5af5384')


build() {
  cd $startdir/src

  strfile matrix matrix.dat

  install -D -m644 matrix $startdir/pkg/usr/share/fortune/fr/matrix
  install -D -m644 matrix.dat $startdir/pkg/usr/share/fortune/fr/matrix.dat

}
