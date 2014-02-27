# Maintainer: Przemyslaw Zoltowski <przemek zoltowski at gmail dot com>

pkgname=irrtoolset
pkgver=5.0.1
pkgrel=1
pkgdesc="Suite of tools to operate with routing policies in RPSL format."
arch=('i686' 'x86_64')
url="http://irrtoolset.isc.org/"
license=('custom')
depends=('readline' 'gcc-libs')
makedepends=('gcc' 'libtool' 'flex' 'bison')
source=("ftp://ftp.isc.org/isc/IRRToolSet/IRRToolSet-${pkgver}/${pkgname}-${pkgver}.tar.gz" \
        "patch-src_rpsl_Makefile.in" "patch-src_rpsl_object.cc")
md5sums=('5b58387a30b5d31065057bdb877544dd'
         '22e150b43026aa7e1854439d3f088453'
         '19fe49424eba81beba81a9c37ae8efcf')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -Np0 -i "${srcdir}/patch-src_rpsl_Makefile.in"
  patch -Np0 -i "${srcdir}/patch-src_rpsl_object.cc"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="$pkgdir/" install
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
