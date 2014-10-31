# Maintainer: Łukasz Redynk <mr.erdk@gmail.com>

pkgname=nvml-git

pkgver=1.0.0
pkgrel=1
pkgdesc='NVM Library for persistent memory'
arch=('x86_64')
url="http://pmem.io/"
license=('custom')
depends=('libutil-linux')
makedepends=('git' 'autoconf' 'gzip' 'libutil-linux' 'make')

source=('https://github.com/pmem/nvml/archive/master.zip')
md5sums=('SKIP')

build() {
   cd $srcdir/nvml-master
   msg2 "compiling and building library"
   unset CPPFLAGS
   CFLAGS+=' -D_FORTIFY_SOURCE=2'
   make
}

package() {
  # *.so libraries
  mkdir -p $pkgdir/usr/lib64/
  cp $srcdir/nvml-master/src/nondebug/libpmem.so.1.0.0 $pkgdir/usr/lib64/libpmem.so.1.0.0
  ln -s $pkgdir/usr/lib64/libpmem.so.1.0.0 $pkgdir/usr/lib64/libpmem.so.1
  ln -s $pkgdir/usr/lib64/libpmem.so.1 $pkgdir/usr/lib64/libpmem.so
  cp $srcdir/nvml-master/src/nondebug/libvmem.so.1.0.0 $pkgdir/usr/lib64/libvmem.so.1.0.0
  ln -s $pkgdir/usr/lib64/libvmem.so.1.0.0 $pkgdir/usr/lib64/libvmem.so.1
  ln -s $pkgdir/usr/lib64/libvmem.so.1 $pkgdir/usr/lib64/libvmem.so
  
  # header files
  mkdir -p $pkgdir/usr/include
  cp $srcdir/nvml-master/src/include/libpmem.h $pkgdir/usr/include/libpmem.h
  cp $srcdir/nvml-master/src/include/libvmem.h $pkgdir/usr/include/libvmem.h
  
  # manpages
  mkdir -p $pkgdir/usr/share/man/man3/
  gzip -c $srcdir/nvml-master/doc/libpmem.3 > $pkgdir/usr/share/man/man3/libpmem.3.gz
  gzip -c $srcdir/nvml-master/doc/libvmem.3 > $pkgdir/usr/share/man/man3/libvmem.3.gz
}

