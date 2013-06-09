# Maintainer: Simone Sclavi 'Ito' <darkhado@gmail.com>

pkgbase=libmspub
pkgname=('libmspub' 'libmspub-docs')
pkgver=0.0.6
pkgrel=1
pkgdesc="Microsoft Publisher file format parser library (latest snapshost)"
arch=('i686' 'x86_64')
url="http://cgit.freedesktop.org/libreoffice/libmspub/"
source=(http://cgit.freedesktop.org/libreoffice/libmspub/snapshot/${pkgname}-${pkgver}.tar.gz)
md5sums=('SKIP')
license=('GPL2' 'LGPL2.1' 'MPL')
depends=('icu' 'libwpd')
options=(!libtool)
makedepends=('boost' 'doxygen' 'wget')

build() {
    cd ${pkgname}-${pkgver}
    ./autogen.sh
    ./configure --prefix=/usr
    make
}
package_libmspub() {
    optdepends=('libmspub-docs: documentation')	

    cd ${pkgname}-${pkgver}
    make DESTDIR=$pkgdir install
    rm -rf ${pkgdir}/usr/share/	
}
package_libmspub-docs(){
   pkgdesc="Documentation for libmspub"
   arch=('any')	
   depends=()

   cd ${pkgbase}-${pkgver}/docs
   mkdir -p ${pkgdir}/usr/share/doc
   cp -r doxygen/html ${pkgdir}/usr/share/doc/libmspub
}
pkgname=libmspub
