# Contributor: Feng Wang <wanng.fenng@gmail.com>

pkgname=showmesh
pkgver=1.0
pkgrel=1
pkgdesc="A Two-Dimensional Quality Mesh Displayer"  
arch=('i686' 'x86_64')
url="http://www-dinma.univ.trieste.it/nirftc/research/easymesh/easymesh.html"
license=('LGPL')
depends=( 'gcc' 'glibc' 'libx11' 'libxcb' 'libxau' 'libxdmcp' )
source=("http://www-dinma.univ.trieste.it/nirftc/research/easymesh/showmesh_1_0.c")
md5sums=('767cb3e610ffadb1058a2a5b75f234df')

build() {
  cd "$srcdir"

  gcc -o showmesh showmesh_1_0.c $CFLAGS -lm -lX11 || return 1

  mkdir -p $pkgdir/usr/bin
  cp showmesh $pkgdir/usr/bin
}
