# Maintainer: carstene1ns <arch carsten-teibes de>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: robb_force <robb_force@holybuffalo.net>

_pkgbase=gngeo
pkgname=${_pkgbase}07
pkgver=0.7
pkgrel=1
pkgdesc="A portable command-line NeoGeo Emulator (legacy version)."
url="http://gngeo.googlecode.com"
license=('GPL custom')
arch=('i686' 'x86_64')
install="$pkgname.install"
source=("$url/files/$_pkgbase-$pkgver.tar.gz"
        "$pkgname.install")
depends=('zlib' 'sdl' 'libgl')
makedepends=('nasm')
provides=("$_pkgbase=0.7")
conflicts=("$_pkgbase")
md5sums=('a91836e6762bbc28ad164ef94b2d00f8'
         '374c53217bde6167182d3a0f483e26d1')
sha256sums=('4c1c56aacede9aceb0d8b2900d7b3edccd2ac6efe7f81a0d3723e998177ab5dc'
            'bd3c3230df8f62d0cce2e753d37ca3de444ef9513a6afff006a58a56a8fbe761')

if [ $CARCH == x86_64 ]; then
  depends=('lib32-zlib' 'lib32-sdl' 'lib32-libgl')
  makedepends=('nasm' 'gcc-multilib')
fi

build() {
  cd "$srcdir/$_pkgbase-$pkgver"

  # change path
  sed 's#games/lib#share#' -i sample_gngeorc

  if [ $CARCH == i686 ]; then
    ./configure --prefix=/usr --mandir=/usr/share/man
  elif [ $CARCH == x86_64 ]; then
    # fix path for lib32
    sed 's|/usr/lib/libGL.so|/usr/lib32/libGL.so|' -i sample_gngeorc

    # force 32 bit build
    sed 's|`sdl-config |`sdl-config-32 |' -i configure
    ./configure --prefix=/usr --mandir=/usr/share/man CC='gcc -m32'
  fi

  # force single threaded build
  make -j1
}

package() {
  cd "$srcdir/$_pkgbase-$pkgver"

  make DESTDIR="$pkgdir" install

  install -Dm644 sample_gngeorc "$pkgdir/usr/share/$_pkgbase/sample_gngeorc"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgbase/COPYING"
}
