# Maintainer: Dr Kitty <bumblingkitty at gmail dot com>
pkgname=rig
pkgver=1.11
pkgrel=1
pkgdesc="Generate a random name and U.S. address and a corresponding area code."
arch=('i686' 'x86_64')
url="http://rig.sourceforge.net/"
license=('GPL')
depends=(gcc-libs)
makedepends=()
options=()
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz"
        'Makefile.patch')
noextract=()
md5sums=('ea11c93520cbb26671bccc35f130b8ce'
         'e4b78d3a0ec08eed376cb8de4c64e08d')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  #prepend the line "#include <cstring>" to rig.cc
  sed -i '1i #include <cstring>' rig.cc

  patch <$srcdir/Makefile.patch

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
