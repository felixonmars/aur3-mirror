# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: farid abdelnour <farid at atelier-lab.org>

pkgname=fms
pkgver=1.0
pkgrel=5
pkgdesc="The F Modular Synthesizer is a tool for creating all kinds of sounds."
arch=('i686' 'x86_64')
url="http://fmsynth.sourceforge.net/"
license=('GPL')
depends=('tk' 'sdl_gfx')
makedepends=('cmake')
source=("http://downloads.sourceforge.net/project/fmsynth/fmsynth/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('3dc0eae280d15ab7bf60d49ddbcca28c')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Compatibility fixes
  sed -i "19a#include <limits.h>" fmplayer.cpp include/fmplayer_mixer.cpp
  sed -i "28i#include <stdio.h>" fmsbackend.cpp

  # man path fix
  sed -i "s|man/man1|share/&|" CMakeLists.txt

  cmake . -DCMAKE_INSTALL_PREFIX=/usr

  # remove insecure rpath
  find . -name link.txt -exec sed -i "s|\-Wl,\-rpath.*||g" {} \;

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
