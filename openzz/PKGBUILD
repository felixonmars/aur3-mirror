# Maintainer: perlawk

pkgname=openzz
pkgver=1.0.4
pkgrel=1
pkgdesc="OpenZz is an interpreted dynamic parser which is well suited to rapid development of parsing solutions, starting from rapid language prototyping to full fledged compilers."
arch=('i686' 'x86_64')
license=('GPL')
depends=('readline')
url=("http://openzz.sourceforge.net/")
source=("http://heanet.dl.sourceforge.net/project/openzz/openzz/openzz-1.0.4-4/openzz-1.0.4-4.tar.gz")

prepare() {
  cd $srcdir/$pkgname-$pkgver/src
  sed -i '1i #include<stdio.h>\n#include<string.h>\n#include<stdlib.h>\n' *.c
  sed -i "s/VERSION/ \"$pkgver\" /;" util.c zz.c
}

build() {
  cd $srcdir/$pkgname-$pkgver/src
  gcc -fpic -c *.c
  gcc -shared -o libozz.so  action.o avl.o defopen.o dumpnet.o err.o interface.o kernel.o lazy.o list.o param.o parse.o printz.o rule.o scope.o source.o sys.o table.o util.o zkernel.o zlex.o zsys.o 
  gcc -shared -o libozzi.so  zzi.o
  gcc -o ozz *.o  -L. -ldl -lreadline
}

package() {
  cd $srcdir/$pkgname-$pkgver/src
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/lib
  mkdir -p "$pkgdir"/usr/include/ozz
  cp ozz "$pkgdir"/usr/bin
  cp zz.h zzbind.h "$pkgdir"/usr/include/ozz
  cp lib*so "$pkgdir"/usr/lib
}

md5sums=('656d50ede005a8f1c2ca9a1daf69e473')
