# Contributor: Feng Wang <wanng.fenng@gmail.com>

pkgname=easymesh
pkgver=1.4
pkgrel=1
pkgdesc="A Two-Dimensional Quality Mesh Generator"  
arch=('i686' 'x86_64')
url="http://www-dinma.univ.trieste.it/nirftc/research/easymesh/easymesh.html"
license=('LGPL')
depends=( 'gcc' )
source=("http://www-dinma.univ.trieste.it/nirftc/research/easymesh/easymesh_1_4.c")
md5sums=('53519c82b4c39a6bf70949472f7fa3eb')

build() {
  cd "$srcdir"

  gcc -o easymesh easymesh_1_4.c $CFLAGS -lm || return 1

  mkdir -p $pkgdir/usr/bin
  cp easymesh $pkgdir/usr/bin
}
