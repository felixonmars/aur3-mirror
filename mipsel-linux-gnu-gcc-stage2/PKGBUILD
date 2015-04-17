# Contributor: Michael Egger <gcarq at-symbol archlinux . info>

_target="mipsel-linux-gnu"
pkgname=${_target}-gcc-stage2
pkgver=4.9.2
pkgrel=1
pkgdesc="The GNU Compiler Collection. Stage 2 for toolchain building (${_target})"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
url="http://gcc.gnu.org"
depends=("${_target}-binutils" "${_target}-eglibc-headers" 'libmpc' 'elfutils')
options=('!buildflags' '!libtool' '!emptydirs' 'zipman' 'docs' '!strip'
  'staticlibs')
conflicts=("${_target}-gcc-stage1")
replaces=("${_target}-gcc-stage1")
provides=("${_target}-gcc-stage1")
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
    --disable-nls \
    --disable-libatomic \
    --disable-libssp \
    --disable-libquadmath \
    --disable-shared \
    --disable-threads \
    --enable-languages=c \
    --enable-multilib \
    --with-local-prefix=/usr/${_target} \
    --with-sysroot=/usr/${_target} \
    --with-as=/usr/bin/${_target}-as \
    --with-ld=/usr/bin/${_target}-ld \
    --enable-softfloat \
    --with-float=soft \
    --disable-libmudflap \
    --disable-libgomp

  make all-gcc all-target-libgcc
}

package() {
  cd "${srcdir}/gcc-${pkgver}"/gcc-build

  export CFLAGS="-O2 -pipe"
  export CXXFLAGS="-O2 -pipe"

  make DESTDIR="$pkgdir" install-gcc install-target-libgcc

  rm -rf "$pkgdir"/usr/share/{man/man7,info}/

  cp -r "$pkgdir"/usr/libexec/* "$pkgdir"/usr/lib/
  rm -rf "$pkgdir/usr/libexec"

  # strip it manually
  strip "$pkgdir"/usr/bin/* 2>/dev/null || true
  find "$pkgdir"/usr/lib -type f -exec /usr/bin/${_target}-strip \
    --strip-unneeded {} \; 2>/dev/null || true
}
