# Maintainer: ponsfoot <cabezon dot hashimoto at gmail dot com>

pkgname=marisa
#pkgname=('marisa' 'marisa-perl' 'marisa-python2' 'marisa-ruby')
pkgver=0.2.4
pkgrel=2
pkgdesc="Static and space-efficient trie data structure library"
arch=('i686' 'x86_64')
url="https://code.google.com/p/marisa-trie/"
license=('BSD' 'LGPL')
options=(!libtool)
#depends=()
#makedepends=()
changelog=ChangeLog
source=(https://marisa-trie.googlecode.com/files/marisa-${pkgver}.tar.gz)
sha1sums=('fb0ed7d993e84dff32ec456a79bd36a00022629d')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-static \
    # --enable-popcnt
    # --enable-sse2
    # --enable-sse3
    # --enable-ssse3
    # --enable-sse4.1
    # --enable-sse4.2
    # --enable-sse4
    # --enable-sse4a

  sed -i 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' libtool
  sed -i 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' libtool
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
  install -d "${pkgdir}/usr/share/doc/${pkgname}-${pkgver}"
  install -m 644 docs/* AUTHORS COPYING README "${pkgdir}/usr/share/doc/${pkgname}-${pkgver}/"
}
