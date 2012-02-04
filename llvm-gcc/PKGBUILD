# Maintainer: Thomas Dziedzic < gostrc at gmail >
# Contributor: Sebastien Binet <binet@lblbox>

pkgname=llvm-gcc
pkgver=2.8
pkgrel=1
pkgdesc='Low Level Virtual Machine with the GCC front-end.'
arch=('i686' 'x86_64')
url='http://llvm.org'
license=('custom:University of Illinois/NCSA Open Source License')
depends=('llvm')
makedepends=('libffi' 'python' 'ocaml')
conflicts=('llvm-gcc-svn')
source=("http://llvm.org/releases/${pkgver}/llvm-${pkgver}.tgz" 
        "http://llvm.org/releases/${pkgver}/llvm-gcc-4.2-${pkgver}.source.tgz")
md5sums=('220d361b4d17051ff4bb21c64abe05ba'
         'e5b0569f5f018086c62201d87e161154')

build() {
  cd llvm-${pkgver}
  
  # --sysconfdir to configure apparently isn't enough ...
#  sed -i 's:$(PROJ_prefix)/etc/llvm:/etc/llvm:' Makefile.config.in

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-libffi
  
  
#  make ENABLE_OPTIMIZED=$_llvm_optimized
#  make ENABLE_OPTIMIZED=$_llvm_optimized DESTDIR=$pkgdir install
  make

  # now the llvm-gcc part...
  LLVM_GCC_SRC=llvm-gcc-4.2-${pkgver}.source
  LLVM_OBJ_DIR=${srcdir}/llvm-${pkgver}
  cd $srcdir/$LLVM_GCC_SRC
  
  BUILDOPTIONS=LLVM_VERSION_INFO=${pkgver}

  # Don't install libiberty
  sed -i 's/install_to_$(INSTALL_DEST) //' libiberty/Makefile.in

  # Don't run fixincludes
#  sed -i -e 's@\./fixinc\.sh@-c true@' gcc/Makefile.in
	
  # For some reason this is used by default - remove it
#  rm GNUmakefile

  cd ${srcdir}

  rm -rf gcc-build
  mkdir gcc-build
  cd gcc-build

  ../${LLVM_GCC_SRC}/configure \
    --prefix=/usr \
    --program-prefix=llvm- \
    --enable-llvm=$LLVM_OBJ_DIR \
    --enable-languages=c,c++ \
    --disable-shared \
    --disable-multilib \
    --with-tune=generic \
    --enable-threads=posix \
    --enable-__cxa_atexit \
    --libdir=/usr/lib \
    --libexecdir=/usr/lib \
    --enable-clocale=gnu \
    --disable-libstdcxx-pch

  make $BUILDOPTIONS
}

package () {
  cd gcc-build

  make DESTDIR=${pkgdir} install

  rm -f ${startdir}/pkg/usr/lib/lib{stdc++,supc++,gcc_s}.*
  #rm -f ${startdir}/pkg/usr/share/locale/*/LC_MESSAGES/libstdc++.mo
  rm -rf ${startdir}/pkg/usr/share/locale
  rm -rf ${startdir}/pkg/usr/man/man7
}
