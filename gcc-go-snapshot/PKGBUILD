# Maintainer: Mike Rosset <mike.rosset@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org> 

# README this can take along time to build. You can find prebuilt binaries on github
# https://github.com/str1ngs/gcc-go

pkgname=gcc-go-snapshot
_ver=4.7
_snapshot=20110423
pkgver=${_ver}.${_snapshot}
pkgrel=1
pkgdesc="The GNU Compiler Collection developmental snapshot with gcc-go"
arch=('i686' 'x86_64')
license=('GPL3' 'LGPL' 'custom')
url="http://gcc.gnu.org"
depends=('glibc' 'binutils' 'gmp' 'mpfr' 'libmpc' 'ppl' 'isl' 'cloog')
makedepends=('flex' 'bison')
options=('!libtool')
source=(ftp://gcc.gnu.org/pub/gcc/snapshots/${_ver}-${_snapshot}/gcc-{core,g++,go}-${_ver}-${_snapshot}.tar.bz2
	gcc_pure64.patch
	gcc-go-snapshot.conf
	)
md5sums=('7a4897bd0c5532f4ae9cf0c0dd5be0c3'
         '0c6bda5a7802080243c488239c82b6a9'
         'c4eb10590bcf4834e71b47bd27398294'
         '4030ee1c08dd1e843c0225b772360e76'
         '4c90b53817149184d39b5957d6c97433')
build()
{
  cd ${srcdir}/gcc-${_ver}-${_snapshot}

  # Do not install libiberty 
  sed -i 's/install_to_$(INSTALL_DEST) //' libiberty/Makefile.in

  # Do not run fixincludes
  sed -i -e 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  if [ "${CARCH}" = "x86_64" ]; then
    patch -Np1 -i ${srcdir}/gcc_pure64.patch
  fi

  cd ${srcdir}
  mkdir gcc-build && cd gcc-build

  ${srcdir}/gcc-${_ver}-${_snapshot}/configure --prefix=/usr \
      --libdir=/usr/lib --libexecdir=/usr/lib \
      --mandir=/usr/share/man --infodir=/usr/share/info \
      --with-bugurl=https://bugs.archlinux.org/ \
      --enable-languages=c,c++,go \
      --enable-shared --enable-threads=posix \
      --with-system-zlib --enable-__cxa_atexit \
      --disable-libunwind-exceptions --enable-clocale=gnu \
      --enable-gnu-unique-object --enable-linker-build-id \
      --with-ppl --enable-cloog-backend=isl \
      --enable-lto --enable-gold --enable-ld=default \
      --enable-plugin --with-plugin-ld=ld.gold \
      --disable-multilib --disable-libstdcxx-pch \
      --enable-checking=release --disable-werror \
      --program-suffix=-${_ver} --enable-version-specific-runtime-libs

  make
}

package()
{
  cd ${srcdir}/gcc-build

  make -j1 DESTDIR=${pkgdir} install

  # Lazy way of dealing with conflicting man and info pages and locales...
  rm -rf ${pkgdir}/usr/share/

  install -Dm644 ${srcdir}/gcc-${_ver}-${_snapshot}/COPYING.RUNTIME \
    ${pkgdir}/usr/share/licenses/$pkgname/RUNTIME.LIBRARY.EXCEPTION
  
  install -Dm644 ${srcdir}/gcc-go-snapshot.conf ${pkgdir}/etc/ld.so.conf.d/gcc-go-snapshot.conf
  sed -i "s/CHOST/${CHOST}/" ${pkgdir}/etc/ld.so.conf.d/gcc-go-snapshot.conf
  rm ${pkgdir}/usr/lib/libffi*
  rm ${pkgdir}/usr/lib/gcc/${CHOST}/4.7.0/libstdc++.so.6.0.16-gdb.py
}
# vim:set ts=2 sw=2 et:
