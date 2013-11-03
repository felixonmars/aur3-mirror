# Maintainer: Allan McRae <allan@archlinux.org>

pkgname=gcc-snapshot
_ver=4.9
_snapshot=20131027
pkgver=${_ver}.${_snapshot}
pkgrel=1
pkgdesc="The GNU Compiler Collection developmental snapshot"
arch=('i686' 'x86_64')
license=('GPL3' 'LGPL' 'custom')
url="http://gcc.gnu.org"
depends=('glibc' 'binutils' 'gmp' 'mpfr' 'libmpc' 'isl' 'cloog')
makedepends=('flex' 'bison')
checkdepends=('dejagnu')
options=('!libtool' '!strip')
source=(ftp://gcc.gnu.org/pub/gcc/snapshots/${_ver}-${_snapshot}/gcc-${_ver}-${_snapshot}.tar.bz2)
md5sums=('5cceb9f5c847a8717053e0eb219e9e67')

prepare() {
  cd ${srcdir}/gcc-${_ver}-${_snapshot}

  # Do not run fixincludes
  sed -i -e 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  # Arch Linux installs x86_64 libraries /lib
  [[ $CARCH == "x86_64" ]] && sed -i '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

  mkdir ${srcdir}/gcc-build
}

build() {
  cd ${srcdir}/gcc-build

  # using -pipe causes spurious test-suite failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48565
  CFLAGS=${CFLAGS/-pipe/}
  CXXFLAGS=${CXXFLAGS/-pipe/}

  # add ada,fortran,go,objc,obj-c++ as wanted
  # additional languages not tested... leave a comment about conflicts
  _languages="c,c++,lto"

  ${srcdir}/gcc-${_ver}-${_snapshot}/configure --prefix=/usr \
      --libdir=/usr/lib --libexecdir=/usr/lib \
      --mandir=/usr/share/man --infodir=/usr/share/info \
      --datadir=/usr/share/gcc-${_ver} \
      --with-bugurl=http://aur.archlinux.org/packages.php?ID=16045 \
      --enable-languages=${_languages} \
      --enable-shared --enable-threads=posix \
      --with-system-zlib --enable-__cxa_atexit \
      --disable-libunwind-exceptions --enable-clocale=gnu \
      --disable-libstdcxx-pch \
      --enable-gnu-unique-object --enable-linker-build-id \
      --enable-cloog-backend=isl --disable-cloog-version-check \
      --enable-lto --enable-gold --enable-ld=default \
      --enable-plugin --with-plugin-ld=ld.gold \
      --with-linker-hash-style=gnu --disable-install-libiberty \
      --disable-multilib --disable-libssp --disable-werror \
      --enable-checking=release \
      --program-suffix=-${_ver} --enable-version-specific-runtime-libs
  make
}

check() {
  cd gcc-build

  # increase stack size to prevent test failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=31827
  ulimit -s 32768

  # do not abort on error as some are "expected"
  make -k check || true
  ${srcdir}/gcc-${_ver}-${_snapshot}/contrib/test_summary
}

package() {
  cd ${srcdir}/gcc-build

  make DESTDIR=${pkgdir} install

  rm $pkgdir/usr/lib/gcc/$CHOST/4.9.0/libstdc++.so.*-gdb.py

  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=56780
  #rm $pkgdir/usr/lib/libiberty.a

  # deal with conflicting man and info pages
  rm ${pkgdir}/usr/share/man/man7/{fsf-funding,gfdl,gpl}.7
  for i in $pkgdir/usr/share/info/*; do
    mv $i ${i//.info}-${_ver}.info
  done

  install -Dm644 ${srcdir}/gcc-${_ver}-${_snapshot}/COPYING.RUNTIME \
    ${pkgdir}/usr/share/licenses/$pkgname/RUNTIME.LIBRARY.EXCEPTION
}
