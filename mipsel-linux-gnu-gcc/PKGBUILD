# Contributor: Michael Egger <gcarq at-symbol archlinux . info>

_target="mipsel-linux-gnu"
pkgname=${_target}-gcc
pkgver=4.9.2
pkgrel=1
pkgdesc="The GNU Compiler Collection for the MIPS architecture"
url="http://www.gnu.org/software/gcc/"
arch=('i686' 'x86_64')
license=('GPL')
depends=("${_target}-binutils" 'libmpc' 'elfutils')
options=('!buildflags' '!libtool' '!emptydirs' 'zipman' 'docs' '!strip' 'staticlibs')
conflicts=("${_target}-gcc-stage1" "${_target}-gcc-stage2")
replaces=("${_target}-gcc-stage1" "${_target}-gcc-stage2")
provides=("${_target}-gcc-stage1=${pkgver}" "${_target}-gcc-stage2=${pkgver}")
source=(ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.bz2)
md5sums=('4df8ee253b7f3863ad0b86359cd39c43')

build() {
  cd "${srcdir}/gcc-${pkgver}"

  export CFLAGS="-O2 -pipe"
  export CXXFLAGS="-O2 -pipe"

  echo ${pkgver} > gcc/BASE-VER

  [[ -d gcc-build ]] || mkdir gcc-build
  cd gcc-build

  [ $NOEXTRACT -eq 1 ] || ../configure \
    --prefix=/usr \
    --program-prefix=${_target}- \
    --target=${_target} \
    --host=$CHOST \
    --build=$CHOST \
    --disable-shared \
    --disable-nls \
    --disable-threads \
    --disable-libmudflap \
    --disable-libssp \
    --disable-libquadmath \
    --disable-libatomic \
    --enable-languages=c \
    --enable-multilib \
    --with-sysroot=/usr/${_target} \
    --with-build-sysroot=/usr/${_target} \
    --with-as=/usr/bin/${_target}-as \
    --with-ld=/usr/bin/${_target}-ld \
    --enable-softfloat \
    --with-float=soft \
    --disable-libgomp 
    # --enable-__cxa_atexit \

  make all-gcc all-target-libgcc all-target-libstdc++-v3
}

package() {
  cd "${srcdir}/gcc-${pkgver}"/gcc-build

  export CFLAGS="-O2 -pipe"
  export CXXFLAGS="-O2 -pipe"

  make "DESTDIR=$pkgdir" install-gcc install-target-libgcc install-target-libstdc++-v3

  rm -rf "$pkgdir"/usr/share/{man/man7,info}/

  cp -r "$pkgdir"/usr/libexec/* "$pkgdir/usr/lib/"
  rm -rf "$pkgdir/usr/libexec"

  rm -rf "$pkgdir/usr/share/gcc-${pkgver}/python"

  # strip it manually
  strip "$pkgdir"/usr/bin/* 2>/dev/null || true
  find "$pkgdir"/usr/lib -type f -exec /usr/bin/${_target}-strip \
    --strip-unneeded {} \; 2>/dev/null || true
}
