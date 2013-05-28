# Maintainer: ponsfoot <cabezon dot hashimoto at gmail dot com>

_pkgname=marisa
pkgname=${_pkgname}-ruby
pkgver=0.2.4
pkgrel=1
pkgdesc="Ruby language binding for marisa"
arch=('i686' 'x86_64')
url="https://code.google.com/p/marisa-trie/"
license=('BSD' 'LGPL')
options=(!libtool)
depends=('marisa' 'ruby')
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

  cd "${srcdir}/${_pkgname}-${pkgver}/bindings/ruby"
  ruby extconf.rb \
    --with-opt-include="${srcdir}/${_pkgname}-${pkgver}/lib" \
    --with-opt-lib="${srcdir}/${_pkgname}-${pkgver}/lib/.libs" \
    --vendor
  make
}

package() {
  cd "${_pkgname}-${pkgver}/bindings/ruby"
  _hdrdir=`pkg-config --variable=rubyhdrdir ruby-2.0`
  _arch=`pkg-config --variable=arch ruby-2.0`
  make DESTDIR="$pkgdir" install \
    hdrdir="$_hdrdir" \
    arch_hdrdir="${_hdrdir}/${_arch}" \
    rubyhdrdir="$_hdrdir"
}
