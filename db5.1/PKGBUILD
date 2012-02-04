# Maintainer: David Strobach <lalochcz@gmail.com>
# Contributor: Leslie P. Polzer <polzer@gnu.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname=db5.1
pkgver=5.1.29
pkgrel=1
pkgdesc="The Berkeley DB embedded database system 5.1"
arch=('i686' 'x86_64')
url="http://www.oracle.com/technology/software/products/berkeley-db/index.html"
license=('custom')
depends=('gcc-libs' 'sh')
options=('!libtool')
source=(http://download.oracle.com/berkeley-db/db-${pkgver}.tar.gz)
md5sums=('a94ea755ab695bc04f82b94d2e24a1ef')

build() {
  cd "${srcdir}/db-${pkgver}/build_unix"
  ../dist/configure --prefix=/usr --enable-compat185 \
    --enable-shared --enable-static --enable-cxx
  make LIBSO_LIBS=-lpthread
}

package() {
  cd "${srcdir}/db-${pkgver}/build_unix"
  make DESTDIR="${pkgdir}" \
       includedir=/usr/include/db51 \
       install
  rm -r "${pkgdir}"/usr/docs
  rm -f ${startdir}/pkg/usr/lib/libdb{,_cxx}.{a,so}
  rm -f ${startdir}/pkg/usr/lib/libdb{,_cxx}-5.{a,so}
  cd "${pkgdir}/usr/bin"
  for i in *; do
    mv $i db5.1_${i/db_/}
  done  
  install -Dm644 "${srcdir}"/db-${pkgver}/LICENSE \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
