# Maintainer: Chad Versace <chad.versace@linux.intel.com>
pkgname='waffle-1'
pkgver='1.1'
pkgrel=1
pkgdesc='a library for choosing window system and OpenGL API at runtime'
arch=('i686' 'x86_64')
url='http://people.freedesktop.org/~chadversary/waffle'
license=('BSD')

depends=(
  'libgl' # for GLX
  'libegl'
  'libx11'
  'libxcb'
  )
makedepends=(
  'cmake'
  'xcb-proto'
  )
source=("http://people.freedesktop.org/~chadversary/waffle/files/release/$pkgname.$pkgver/$pkgname.$pkgver.tar.xz")
sha256sums=('7219d2e02338f7f5410e83087a0465b0a59710e738b771b9b32c0d2b2305c596')

build() {
  cd "$srcdir/$pkgname.$pkgver"

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -Dwaffle_has_glx=1 \
    -Dwaffle_has_x11_egl=1 \
    -Dwaffle_has_wayland=0 \
    -Dwaffle_build_examples=0
  make
}

package() {
  cd "$srcdir/$pkgname.$pkgver"
  make DESTDIR="$pkgdir/" install
  install -m755 -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 "$pkgdir/usr/share/doc/waffle-1/LICENSE.txt" \
                "$pkgdir/usr/share/licenses/waffle-1/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
