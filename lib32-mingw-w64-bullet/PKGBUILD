pkgname=lib32-mingw-w64-bullet
pkgver=2.81
pkgrel=1
_pkgrev=2613
pkgdesc="A 3D Collision Detection and Rigid Body Dynamics Library for games and animation (mingw-w64, 32-bit)"
arch=(any)
url="http://www.bulletphysics.com/Bullet"
license=("zlib")
makedepends=(mingw-w64-gcc cmake)
depends=(mingw-w64-crt)
options=(!libtool !strip !buildflags)
source=("http://bullet.googlecode.com/files/${pkgname#lib32-mingw-w64-}-${pkgver}-rev$_pkgrev.tgz"
"Toolchain-i686-w64-mingw32.cmake"
"bullet.pc")
md5sums=('cec9c9a79c2804dbf6385dd7d061346c'
         'da10ad00a161800e0b011a77c3efbf76'
         'd1da06deba3b08b884d2212f6838905c')

_architectures="i686-w64-mingw32"

build() {
  cd "$srcdir/${pkgname#lib32-mingw-w64-}-$pkgver-rev$_pkgrev"
  unset LDFLAGS
  for _arch in ${_architectures}; do
    mkdir "build-${_arch}" && pushd "build-${_arch}"
    PATH="/usr/${_arch}/bin:$PATH" cmake \
      -DCMAKE_INSTALL_PREFIX:PATH=/usr/${_arch} \
      -DBUILD_SHARED_LIBS:BOOL=ON \
      -DCMAKE_TOOLCHAIN_FILE=${srcdir}/Toolchain-${_arch}.cmake \
      -DBUILD_DEMOS:BOOL=OFF \
      -DINSTALL_LIBS:BOOL=ON \
      -DUSE_GLUT:BOOL=OFF \
      -DBUILD_EXTRAS:BOOL=ON \
      -DINSTALL_EXTRA_LIBS:BOOL=ON \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/${pkgname#lib32-mingw-w64-}-$pkgver-rev$_pkgrev/build-${_arch}"
    make DESTDIR="$pkgdir" install
    mkdir -p "$pkgdir/usr/${_arch}/bin"
    mv "$pkgdir/usr/${_arch}/lib/"*.dll "$pkgdir/usr/${_arch}/bin"
    install -Dm644 "$srcdir/bullet.pc" "$pkgdir/usr/$_arch/lib/pkgconfig/bullet.pc"
    find "$pkgdir/usr/${_arch}" -name '*.exe' -o name '*.bat' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip -x
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
  done
}