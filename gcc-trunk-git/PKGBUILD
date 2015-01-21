# Maintainer: Allan McRae <allan@archlinux.org>

pkgname=gcc-trunk-git
pkgver=4.9.124128.885cf45
pkgrel=1
pkgdesc="The GNU Compiler Collection developmental snapshot"
arch=('any')
license=('GPL3' 'LGPL' 'custom')
url="http://gcc.gnu.org"
depends=('glibc' 'binutils' 'gmp' 'mpfr' 'libmpc' 'isl' 'cloog')
makedepends=('flex' 'bison' 'git')
provides=('gcc' 'gcc-multilib')
checkdepends=('dejagnu')
options=('!libtool' '!strip')
source=('git+git://gcc.gnu.org/git/gcc.git#branch=trunk')
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/gcc

  _ver=$(cat ${srcdir}/gcc/gcc/BASE-VER)
  _ver=${_ver%.*}

  echo ${_ver}.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd ${srcdir}/gcc

  # Arch Linux installs x86_64 libraries /lib
  [[ $CARCH == "x86_64" ]] && sed -i '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64

  mkdir ${srcdir}/gcc-build
}

build() {
  cd ${srcdir}/gcc-build

  _ver=$(cat ${srcdir}/gcc/gcc/BASE-VER)
  _ver=${_ver%.*}

  # add ada,fortran,go,objc,obj-c++ as wanted
  # additional languages not tested...
  _languages="c,c++,lto"

  ${srcdir}/gcc/configure --prefix=/usr \
      --libdir=/usr/lib --libexecdir=/usr/lib \
      --mandir=/usr/share/man --infodir=/usr/share/info \
      --datadir=/usr/share/gcc-${_ver} \
      --enable-languages=${_languages} \
      --enable-shared --enable-threads=posix \
      --with-system-zlib --enable-__cxa_atexit \
      --disable-libunwind-exceptions --enable-clocale=gnu \
      --disable-libstdcxx-pch \
      --enable-gnu-unique-object --enable-linker-build-id \
      --enable-cloog-backend=isl --disable-cloog-version-check \
      --enable-lto --enable-gold --enable-ld=default \
      --enable-plugin --with-plugin-ld=ld.gold \
      --with-linker-hash-style=gnu --disable-install-libiberty
      --disable-libssp --disable-werror \
      --enable-checking=release \
      --program-suffix=-${_ver} --enable-version-specific-runtime-libs
  make
}

check() {
  cd gcc-build

  # do not abort on error as some are "expected"
  make -k check || true
  ${srcdir}/gcc/contrib/test_summary
}

package() {
  cd ${srcdir}/gcc-build

  _ver=$(cat ${srcdir}/gcc/gcc/BASE-VER)
  _ver=${_ver%.*}

  make DESTDIR=${pkgdir} install

  rm $pkgdir/usr/lib/gcc/$CHOST/*/libstdc++.so.*-gdb.py

  # deal with conflicting man and info pages
  rm ${pkgdir}/usr/share/man/man7/{fsf-funding,gfdl,gpl}.7
  for i in $pkgdir/usr/share/info/*; do
    mv $i ${i//.info}-${_ver}.info
  done

  install -Dm644 ${srcdir}/gcc/COPYING.RUNTIME \
    ${pkgdir}/usr/share/licenses/$pkgname/RUNTIME.LIBRARY.EXCEPTION
}
