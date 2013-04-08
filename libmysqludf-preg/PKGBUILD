# Maintainer: Sid Karunaratne <sid@karunaratne.net>
pkgname=libmysqludf-preg
_pkgname=lib_mysqludf_preg
pkgver=1.1
pkgrel=1
pkgdesc="a library of mysql UDF that provide access to the PCRE library for pattern matching"
arch=('i686' 'x86_64')
url="https://github.com/mysqludf/lib_mysqludf_preg"
license=('GPL3')
depends=('mysql' 'pcre')
makedepends=('mysql')
install=install
source=("https://github.com/mysqludf/${_pkgname}/archive/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('a8e540cfcd8eaa427b31368772098b1b1cc963e56faa0d8e1dddb7352ace55cf')


build() {
  cd "${srcdir}/${_pkgname}-${_pkgname}-${pkgver}"
  ./configure
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  rm "${pkgdir}/usr/lib/mysql/plugin/lib_mysqludf_preg.la"
  rm "${pkgdir}/usr/lib/mysql/plugin/lib_mysqludf_preg.a"
}
