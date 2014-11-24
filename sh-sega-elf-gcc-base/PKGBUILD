# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Martin Schmölzer <mschmoelzer@gmail.com>

_target=sh-sega-elf
pkgname=${_target}-gcc-base
pkgver=4.9.2
_islver=0.12.2
_cloogver=0.18.1
pkgrel=1
#_snapshot=4.9-20140903
pkgdesc="The GNU Compiler Collection - C only cross compiler for Renesas SH-based SEGA consoles"
arch=(i686 x86_64)
url='http://gcc.gnu.org/'
license=(GPL LGPL FDL)
depends=(${_target}-binutils)
makedepends=(gmp mpfr)
options=(!emptydirs !strip staticlibs)
source=(ftp://gcc.gnu.org/pub/gcc/releases/gcc-$pkgver/gcc-$pkgver.tar.bz2
        #ftp://gcc.gnu.org/pub/gcc/snapshots/$_snapshot/gcc-$_snapshot.tar.bz2
        http://isl.gforge.inria.fr/isl-$_islver.tar.bz2
        http://www.bastoul.net/cloog/pages/download/cloog-$_cloogver.tar.gz)
sha256sums=('2020c98295856aa13fda0f2f3a4794490757fc24bcca918d52cc8b4917b972dd'
            'f4b3dbee9712850006e44f0db2103441ab3d13b406f77996d1df19ee89d11fb4'
            '02500a4edd14875f94fe84cbeda4290425cb0c1c2474c6f75d75a303d64b4196')

if [ -n "$_snapshot" ]; then
  _basedir=gcc-$_snapshot
else
  _basedir=gcc-$pkgver
fi

prepare() {
  cd $_basedir

  # link isl/cloog for in-tree builds
  ln -s ../isl-$_islver isl
  ln -s ../cloog-$_cloogver cloog

  echo $pkgver > gcc/BASE-VER

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

  mkdir $srcdir/gcc-build
}

build() {
  cd gcc-build

  export CFLAGS_FOR_TARGET='-g -Os -ffunction-sections -fdata-sections -fno-exceptions'
  export CXXFLAGS_FOR_TARGET='-g -Os -ffunction-sections -fdata-sections -fno-exceptions'
  $srcdir/$_basedir/configure \
    --target=$_target \
    --prefix=/usr \
    --with-sysroot=/usr/${_target} \
    --with-native-system-header-dir=/include \
    --libexecdir=/usr/lib \
    --enable-languages=c \
    --disable-plugins \
    --disable-decimal-float \
    --disable-libffi \
    --disable-libgomp \
    --disable-libmudflap \
    --disable-libquadmath \
    --disable-libssp \
    --disable-libstdcxx-pch \
    --disable-nls \
    --disable-shared \
    --disable-threads \
    --disable-tls \
    --with-gnu-as \
    --with-gnu-ld \
    --with-system-zlib \
    --with-newlib \
    --with-python-dir=share/gcc-${_target} \
    --with-gmp \
    --with-mpfr \
    --with-mpc \
    --with-cloog \
    --with-isl \
    --enable-cloog-backend=isl \
    --with-libelf \
    "--with-host-libstdcxx=-static-libgcc -Wl,-Bstatic,-lstdc++,-Bdynamic -lm" \
    --with-endian=little,big \
    --with-cpu=m4-single-only \
    --with-multilib-list=m4-nofpu,m4,m2,!m2,!mb/m4-nofpu,!mb/m4,!mb

    make INHIBIT_LIBC_CFLAGS="-DUSE_TM_CLONE_REGISTRY=0" all-gcc all-target-libgcc
}

package() {
  cd gcc-build

  make DESTDIR="$pkgdir" install -j1 install-gcc install-target-libgcc

  # strip target binaries
  find "$pkgdir"/usr/lib/gcc/$_target/ -type f -and \( -name \*.a -or -name \*.o \) -exec $_target-objcopy -R .comment -R .note -R .debug_info -R .debug_aranges -R .debug_pubnames -R .debug_pubtypes -R .debug_abbrev -R .debug_line -R .debug_str -R .debug_ranges -R .debug_loc '{}' \;

  # strip host binaries
  find "$pkgdir"/usr/bin/ "$pkgdir"/usr/lib/gcc/$_target/ -type f -and \( -executable \) -exec strip '{}' \;

  # Remove files that conflict with host gcc package
  rm -r "$pkgdir"/usr/share/man/man7
  rm -r "$pkgdir"/usr/share/info
}
