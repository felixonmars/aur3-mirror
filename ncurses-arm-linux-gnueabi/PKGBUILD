# Maintainer: Aaron Abbott <aaron.abbott1@gmail.com>
# PKGBUILD originally from ABS: Allan McRae, judd

_target="arm-linux-gnueabi"
_pkgname=ncurses
pkgname=ncurses-${_target}
pkgver=5.9
pkgrel=5
pkgdesc="System V Release 4.0 curses emulation library. Builds for arm-linux-gnueabi cross compilation"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/ncurses/"
license=('MIT')
depends=('glibc' "${_target}-gcc")
options=(!strip)
source=(ftp://ftp.gnu.org/pub/gnu/${_pkgname}/${_pkgname}-${pkgver}.tar.gz{,.sig})
md5sums=('8cb9c412e5f2d96bc6f459aa8c6282a1'
         '014ffdbbfec6d41a9a89d6cbe6434638')

build() {
  #cross compilation specific
  unset CFLAGS #do not use CFLAGS in /etc/makepkg.conf
  unset CXXFLAGS
  
  export CFLAGS="${CFLAGS} -U_FORTIFY_SOURCE -mlittle-endian -msoft-float -O2"
  export BUILD_CC=gcc
  export CC=${_target}-gcc
  export CXX=${_target}-g++
  export AR=${_target}-ar
  export RANLIB=${_target}-ranlib
  
  #rest of build
  cd ${srcdir}/
  mkdir -p ncurses{,w}-build

  cd ${srcdir}/ncursesw-build
  
  ../${_pkgname}-${pkgver}/configure --prefix=/usr/${_target} --target=${_target} --host=${_target} --without-manpages --with-shared --with-normal --without-debug --without-ada --enable-widec --enable-pc-files
  # add --enable-ext-colors and --enable-ext-mouse with next soname bump
  
  make ${MAKEFLAGS}

  # libraries for external binary support 
  cd ${srcdir}/ncurses-build
  [ $CARCH = "x86_64" ] && CONFIGFLAG="--with-chtype=long"
  ../${_pkgname}-${pkgver}/configure --prefix=/usr/${_target} \
    --target=${_target} --host=${_target} \
    --with-shared --with-normal --without-debug --without-ada $CONFIGFLAG
  make ${MAKEFLAGS}
}

package() {
  cd ${srcdir}/ncursesw-build
  make DESTDIR=${pkgdir} install
  
  # fool packages looking to link to non-wide-character ncurses libraries
  for lib in ncurses form panel menu; do
    echo "INPUT(-l${lib}w)" >${pkgdir}/usr/${_target}/lib/lib${lib}.so
    ln -s lib${lib}w.a ${pkgdir}/usr/${_target}/lib/lib${lib}.a
  done
  ln -s libncurses++w.a ${pkgdir}/usr/${_target}/lib/libncurses++.a

  # Not sure why make doesn't install this in the right dir
  mv ${pkgdir}/usr/lib/pkgconfig ${pkgdir}/usr/${_target}/lib/pkgconfig
  rmdir ${pkgdir}/usr/lib

  for lib in ncurses ncurses++ form panel menu; do
    ln -s ${lib}w.pc ${pkgdir}/usr/${_target}/lib/pkgconfig/${lib}.pc
  done
  
  # Again, not sure why make doesn't do this the same way as the regular
  # Arch pkgbuild for ncurses
  for lib in `ls ${pkgdir}/usr/${_target}/include/ncursesw/*`
  do
    ln -s $lib ${pkgdir}/usr/${_target}/include/.
  done

  # some packages look for -lcurses during build
  echo "INPUT(-lncursesw)" >${pkgdir}/usr/${_target}/lib/libcursesw.so
  ln -s libncurses.so ${pkgdir}/usr/${_target}/lib/libcurses.so
  ln -s libncursesw.a ${pkgdir}/usr/${_target}/lib/libcursesw.a
  ln -s libncurses.a ${pkgdir}/usr/${_target}/lib/libcurses.a

  # non-widec compatibility libraries
  cd ${srcdir}/ncurses-build
  for lib in ncurses form panel menu; do
    install -Dm755 lib/lib${lib}.so.${pkgver} ${pkgdir}/usr/${_target}/lib/lib${lib}.so.${pkgver}
    ln -s lib${lib}.so.${pkgver} ${pkgdir}/usr/${_target}/lib/lib${lib}.so.5
  done

  # install license, rip it from the readme
  cd ${srcdir}/${_pkgname}-${pkgver}
  install -dm755 ${pkgdir}/usr/${_target}/share/licenses/$pkgname
  grep -B 100 '$Id' README > ${pkgdir}/usr/${_target}/share/licenses/${pkgname}/license.txt
}
