# $Id$
# Maintainer: Dennis Ranke <dennis.ranke@gmail.com>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: tocer <tocer.deng@gmail.com>

_pkgbasename=v8
pkgname=lib32-$_pkgbasename
pkgver=3.19.0
pkgrel=1
pkgdesc='Fast and modern Javascript engine (32-bit)'
arch=('x86_64')
url='http://code.google.com/p/v8'
license=('BSD')
depends=(gcc-multilib 'lib32-readline' $_pkgbasename)
makedepends=('subversion' 'python2')
source=(http://commondatastorage.googleapis.com/chromium-browser-official/v8-$pkgver.tar.bz2)
sha256sums=('35af5629792e958968eacc94daef3ad358b6ed7126875db6138664f51c061368')

ARCH=ia32

prepare() {
  cd $_pkgbasename-$pkgver

  # Fetch gyp
  make dependencies

  # The world isn't ready for python3
  export PYTHON=python2
  find build/ test/ tools/ src/ -type f \
    -exec sed -e 's_^#!/usr/bin/env python$_&2_' \
              -e 's_^\(#!/usr/bin/python2\).[45]$_\1_' \
              -e 's_^#!/usr/bin/python$_&2_' \
              -e "s_'python'_'python2'_" -i {} \;
  sed -i 's/python /python2 /' Makefile
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd $_pkgbasename-$pkgver

  make $ARCH.release library=shared console=readline werror=no

  cd "$srcdir" && cp -r $_pkgbasename-$pkgver d8-static-$pkgver
  cd d8-static-$pkgver
  make $ARCH.release library=static console=readline werror=no
}

package() {
  cd $_pkgbasename-$pkgver

  install -Dm755 "$srcdir"/d8-static-$pkgver/out/$ARCH.release/d8 "$pkgdir"/usr/bin/d8-32
  install -Dm755 out/$ARCH.release/lib.target/libv8.so "$pkgdir"/usr/lib32/libv8.so

  install -d "$pkgdir"/usr/share/licenses/$pkgname
  install -m644 LICENSE* ${pkgdir}/usr/share/licenses/$pkgname
}

# vim:set ts=2 sw=2 et:
