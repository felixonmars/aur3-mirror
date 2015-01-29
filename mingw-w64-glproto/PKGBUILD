pkgname=mingw-w64-glproto
pkgver=1.4.17
pkgrel=2
pkgdesc="X11 OpenGL extension wire protocol (mingw-w64)"
arch=('any')
url="http://cgit.freedesktop.org/xorg/proto/${pkgname#mingw-w64-}/"
license=('custom')
options=('staticlibs' '!strip' '!buildflags')
depends=('mingw-w64-crt')
source=("http://xorg.freedesktop.org/releases/individual/proto/${pkgname#mingw-w64-}-${pkgver}.tar.bz2")
md5sums=('5565f1b0facf4a59c2778229c1f70d10')
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

build() {
  cd "$srcdir"/${pkgname#mingw-w64-}-${pkgver}
  for _arch in $_architectures; do
    mkdir -p ${_arch}-build && pushd ${_arch}-build
    ${_arch}-configure
    make
    popd
  done
}

package() {
  cd "$srcdir"/${pkgname#mingw-w64-}-${pkgver}
  for _arch in $_architectures; do
    pushd ${_arch}-build
    make DESTDIR="$pkgdir" install

    install -Dm644 "$srcdir"/${pkgname#mingw-w64-}-${pkgver}/COPYING "$pkgdir/usr/${_arch}/share/licenses/$pkgname/COPYING"
    popd
  done
}
