# Maintainer: oke3 <Sekereg at gmx dot com
# Contributor: Andreas Baumann <abaumann@yahoo.com>

pkgname=curlpp
pkgver=0.7.3
pkgrel=4
pkgdesc="C++ wrapper for libcURL"
arch=('i686' 'x86_64')
url="http://code.google.com/p/curlpp/"
makedepends=('curl' 'boost' 'bc')
depends=('curl' 'boost')
license=('MIT')
options=(!buildflags)
source=(
	http://curlpp.googlecode.com/files/${pkgname}-${pkgver}.tar.gz
	curlpp-0.7.3-example21.patch	
)
sha512sums=('8c0209b74a191049262c29e2f3cd7dc4de44621d060453b553627884d042a11cba5cc76398c3e831f084cb3a69fd8ccab1ac3e12820d42e3d1188bba2d5070e9'
'fdc842249193702870d9263ee6c55804b9bdf01f5662940b9b95def7241001bd73d40bda069fea42961707232d8d2fefa722eea4c23c487461cc96fbfceebf64')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    patch -p1 -i $srcdir/curlpp-0.7.3-example21.patch

    ./configure --prefix=/usr

    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    make DESTDIR="${pkgdir}" install

    # Include config.h
    install -m644 include/curlpp/config.h "${pkgdir}/usr/include/curlpp"

    # License
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
