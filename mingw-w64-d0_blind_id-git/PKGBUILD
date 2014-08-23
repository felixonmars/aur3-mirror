pkgname=mingw-w64-d0_blind_id-git
pkgver=r129.834b51b
pkgrel=1
pkgdesc="Cryptographic library for identification with Schnorr ID scheme and Blind RSA Signatures (mingw-w64)"
arch=(any)
url="http://github.com/divVerent/d0_blind_id"
license=('BSD')
depends=('mingw-w64-crt' 'mingw-w64-gmp')
makedepends=('mingw-w64-gcc' 'git')
options=('staticlibs' '!buildflags' '!strip')
source=("git+https://github.com/divVerent/d0_blind_id.git")
md5sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd "$srcdir/d0_blind_id"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/d0_blind_id"
  # PR #1: https://github.com/divVerent/d0_blind_id/pull/1
  sed -i "s|-versioninfo|-no-undefined -versioninfo|g" Makefile.am
}

build() {
  cd "$srcdir/d0_blind_id"
  sh autogen.sh
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p build-${_arch} && pushd build-${_arch}
    ../configure --prefix=/usr/${_arch} \
                 --host=${_arch}
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/d0_blind_id/build-${_arch}
    make install DESTDIR="$pkgdir"
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

