_gitname=daala
pkgname=mingw-w64-libdaala
pkgver=1079.bb04572
pkgver() { cd $_gitname && echo $(git rev-list --count master).$(git rev-parse --short master); }
pkgrel=1
pkgdesc="Daala is next-next-gen video compression technology from Xiph.org, Mozilla and others. (mingw-w64)"
arch=('any')
url="https://www.xiph.org/daala/"
license=('BSD')
depends=('mingw-w64-libogg')
makedepends=('git' 'mingw-w64-configure')
options=('!buildflags' '!strip' 'staticlibs')
source=('git://git.xiph.org/daala.git')
md5sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd $_gitname
  ./autogen.sh
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}  
    ${_arch}-configure --disable-unit-tests --disable-doc \
      --disable-tools --disable-asm --disable-player
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do  
    cd "$srcdir/$_gitname/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

