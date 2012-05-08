# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=lrc
pkgver=0.9.1
pkgrel=1
pkgdesc="A system for packing many files into a single file for installation and use in a program as its resources."
arch=(i686 x86_64)
url="https://bitbucket.org/StarFire/lrc/overview"
license=('GPL3')
depends=('sdl_image' 'bzip2' 'tinyxml' 'crypto++')
makedepends=('libtool')
options=('!libtool')
source=("https://bitbucket.org/StarFire/lrc/downloads/$pkgname-$pkgver.tar.bz2")
md5sums=('1f625f3d401565ec294f379ac95b95dd')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # do not use inner tinyxml
  sed -i '/SUBDIRS.*tinyxml/d;s/ -[IL]tinyxml//' \
    src/compiler/Makefile.*

  # do not use inner crypto++
  sed -i 's/strategies //;s/-L..\/strategies\/cryptopp/-lpthread/' \
    src/{,compiler,lib}/Makefile.*

  ./configure --prefix=/usr \
              --enable-static=no
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
