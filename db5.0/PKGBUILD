# Maintainer: Madotsuki <madotsuki@cock.li>
# Contributor: Leslie P. Polzer <polzer@gnu.org>
# Contributor: David Strobach <lalochcz@gmail.com>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname=db5.0
pkgver=5.0.32
pkgrel=1
pkgdesc="The Berkeley DB embedded database system 5.0"
arch=('i686' 'x86_64')
url="http://www.oracle.com/technology/software/products/berkeley-db/index.html"
license=('custom')
depends=('gcc-libs' 'sh')
options=('!libtool')
source=(http://download.oracle.com/berkeley-db/db-${pkgver}.tar.gz)
md5sums=('b63afbd6ab191d0f19e00927f25d66fe')

build() {
  cd "${srcdir}/db-${pkgver}/build_unix"
  ../dist/configure --prefix=/usr --enable-compat185 \
    --enable-shared --enable-static --enable-cxx
  make LIBSO_LIBS=-lpthread
}

package() {
  cd "${srcdir}/db-${pkgver}/build_unix"
  make DESTDIR="${pkgdir}" install
  rm -r "${pkgdir}"/usr/docs
  rm -f ${startdir}/pkg/usr/lib/libdb{,_cxx}.{a,so}
  rm -f ${startdir}/pkg/usr/lib/libdb{,_cxx}-5.{a,so}
  cd "${pkgdir}/usr/bin"
  for i in *; do
    mv $i db5.0_${i/db_/}
  done  
  install -Dm644 "${srcdir}"/db-${pkgver}/LICENSE \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
