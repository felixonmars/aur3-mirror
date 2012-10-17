# Maintainer: Vladimir Gorbunov <truedaemon@gmail.com>
pkgname=bebop-smc
pkgver=2007_11_26
pkgrel=1
pkgdesc="BeBOP Sparse Matrix Converter Library"
arch=('x86_64' 'i686')
url="http://bebop.cs.berkeley.edu/smc/"
license=('BSD')
groups=()
depends=('glibc' 'bebop-util')
source=(http://bebop.cs.berkeley.edu/smc/tarballs/bebop_make.tar.gz
        http://bebop.cs.berkeley.edu/smc/tarballs/sparse_matrix_converter.tar.gz)
noextract=()
md5sums=('8757e67dc432b2ff0a42397b69ad7226'
         'dddca83603cc5b7d32b4857139302511')

build() {
  cd "${srcdir}/sparse_matrix_converter"
  sed -i 1i"LIBS += -L/usr/lib -lbebop_util" Makefile
  sed -i 1i"CPPFLAGS += -I/usr/include" Makefile
  make
}

package() {
  cd "${srcdir}/sparse_matrix_converter"
  mkdir -p "${pkgdir}/usr/include/"
  cp -R include/* "${pkgdir}/usr/include/"
  install -D libsparse_matrix_converter.a "${pkgdir}/usr/lib/libsparse_matrix_converter.a"
  install -D libsparse_matrix_converter.so "${pkgdir}/usr/lib/libsparse_matrix_converter.so"
  install -D sparse_matrix_converter "${pkgdir}/usr/bin/sparse_matrix_converter"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
