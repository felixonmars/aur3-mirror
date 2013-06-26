# Maintainer: Martin Schmölzer <mschmoelzer@gmail.com>

_pkgbasename=freetype2-git-infinality
pkgname=lib32-${_pkgbasename}
pkgver=2.4.99.git20130513
pkgrel=2
_infinality_version=2.4.12
_infinality_release=01
_infinality_date=20130514
pkgdesc="TrueType font rendering library (32-bit) with Infinality patch"
arch=(x86_64)
url="http://www.infinality.net/"
license=('GPL')
depends=('lib32-zlib' "${_pkgbasename}=${pkgver}")
makedepends=('gcc-multilib' 'git')
provides=("lib32-freetype2=$pkgver")
conflicts=('lib32-freetype2')
options=('!libtool')
source=(git://git.sv.nongnu.org/freetype/freetype2.git#commit=6650be7c43c9f7299a0bfbd5d81b481efbe9d95b
        http://www.infinality.net/fedora/linux/zips/freetype-infinality-${_infinality_version}-${_infinality_date}_${_infinality_release}-x86_64.tar.bz2
        freetype2-enable-valid.patch)
sha256sums=('SKIP'
            '151973c65d9de980df9d39849b38132743ea7c44dcaadca16bfcf3daf7b7e2d1'
            '97751d04014b7f2a42bce3ed99417eeb058563e2b7c94251f05f489666fec5bb')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${srcdir}/freetype2"

  # We need to generate the configure script BEFORE applying patches because
  # Infinality patches this script
  sh autogen.sh

  # Apply miscellaneous patches.
  patch -Np0 -i "${srcdir}/freetype2-enable-valid.patch"

  # Apply Infinality patch.
  patch -Np1 -i "${srcdir}/freetype-entire-infinality-patchset-${_infinality_date}-${_infinality_release}".patch

  # Run configure script
  ./configure --prefix=/usr --libdir=/usr/lib32

  make
}

package() {
  cd "${srcdir}/freetype2"

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share,bin}
}

# vim: set ts=2 sw=2 ft=sh noet:
