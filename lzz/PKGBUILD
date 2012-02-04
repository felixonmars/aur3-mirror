# Maintainer: Caleb Reach <jtxx000@gmail.com>
pkgname=lzz
pkgver=2.8.2
pkgrel=2
pkgdesc="generate header and implementation files from an lzz file"
arch=('i686' 'x86_64')
url="http://www.lazycplusplus.com/"
source=('http://www.lazycplusplus.com/lzz_2_8_2_src_gen.zip')
license=('GPL')
md5sums=('9818a868bc73eef866617275b62efcc6')

build() {
  cd "$srcdir/$pkgname"*_src_gen/

  make -f Makefile.release || return 1

  install -D lazycpp "$pkgdir"/usr/bin/lzz
}
