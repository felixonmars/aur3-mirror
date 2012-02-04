pkgname=gcc2
pkgver=2.95.3
pkgrel=2
pkgdesc="GNU C/C++ Compiler and libstdc++, version 2"
url="http://www.gnu.org/software/gcc"
license="GPL"
depends=('glibc')
install=
source=(ftp://ftp.gnu.org/gnu/gcc/gcc-$pkgver.tar.gz \
        http://www.linuxfromscratch.org/patches/lfs/5.0/gcc-2.95.3-2.patch \
        http://www.linuxfromscratch.org/patches/lfs/5.0/gcc-2.95.3-returntype-fix.patch)
md5sums=('f3ad4f32c2296fad758ed051b5ac8e28' '55df4c204d1157f030f64b49d45e7e64'\
         '4ad05637a4b9d655b6ebc64061b93ee8')

build() {
  cd $startdir/src/gcc-$pkgver
  patch -Np1 -i ../gcc-2.95.3-2.patch
  patch -Np1 -i ../gcc-2.95.3-returntype-fix.patch
  echo timestamp > gcc/cstamp-h.in
  mkdir ../gcc-build
  cd ../gcc-build
  ../gcc-$pkgver/configure --prefix=/opt/gcc2 --enable-shared --enable-languages=c,c++ --enable-threads=posix
  make bootstrap || return 1
  make prefix=$startdir/pkg/opt/gcc2 install
}
