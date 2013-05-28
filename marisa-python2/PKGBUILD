# Maintainer: ponsfoot <cabezon dot hashimoto at gmail dot com>

_pkgname=marisa
pkgname=${_pkgname}-python2
pkgver=0.2.4
pkgrel=1
pkgdesc="Python language binding for marisa"
arch=('i686' 'x86_64')
url="https://code.google.com/p/marisa-trie/"
license=('BSD' 'LGPL')
options=(!libtool)
depends=('marisa' 'python2')
makedepends=('swig')
changelog=ChangeLog
source=(https://marisa-trie.googlecode.com/files/marisa-${pkgver}.tar.gz)
sha1sums=('fb0ed7d993e84dff32ec456a79bd36a00022629d')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-static
  sed -i 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' libtool
  sed -i 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' libtool
  make

  cd "${srcdir}/${_pkgname}-${pkgver}/bindings/python"
  python2 setup.py build_ext \
    --include-dirs="${srcdir}/${_pkgname}-${pkgver}/lib" \
    --library-dirs="${srcdir}/${_pkgname}-${pkgver}/lib/.libs"
  python2 setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}/bindings/python"
  python2 setup.py install --root="$pkgdir"
}
