pkgname=mingw-w64-gmqcc-git
pkgver=r2818.a371c4e
pkgrel=1
pkgdesc="An Improved Quake C Compiler (mingw-w64)"
arch=(any)
depends=('mingw-w64-crt')
conflicts=('mingw-w64-gmqcc')
provides=('mingw-w64-gmqcc')
makedepends=('mingw-w64-gcc' 'git')
options=('!buildflags' '!strip')
url="https://github.com/graphitemaster/gmqcc"
license=('MIT')
source=("git+https://github.com/graphitemaster/gmqcc.git")
md5sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd "$srcdir/gmqcc"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"
  for _arch in ${_architectures}; do
    rm -rf build-${_arch} && cp -r gmqcc build-${_arch} && pushd build-${_arch}
    make CC=${_arch}-gcc MINGW=1
    popd
  done
}

package() {
  cd "$srcdir"
  for _arch in ${_architectures}; do
    cd "$srcdir"/build-${_arch}
    make install DESTDIR="${pkgdir}" PREFIX=/usr/${_arch} BINDIR=/usr/${_arch}/bin MANDIR=/usr/${_arch}/share/man MINGW=1 
    rm -r "${pkgdir}"/usr/${_arch}/share
    ${_arch}-strip "${pkgdir}"/usr/${_arch}/bin/*.exe
  done
}

