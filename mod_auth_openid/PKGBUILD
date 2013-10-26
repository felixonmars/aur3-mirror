#Maintainer: Sid Karunaratne <sid@karunaratne.net>
pkgname=mod_auth_openid
pkgver=0.8
pkgrel=1
pkgdesc="An authentication module for the Apache 2 webserver. It handles the functions of an OpenID consumer as specified in the OpenID 2.0 specification"
arch=('i686' 'x86_64')
url="http://findingscience.com/mod_auth_openid"
license=('MIT')
depends=('apache' 'libopkele' 'sqlite')
install="${pkgname}.install"
source=("https://github.com/bmuller/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('86812c9659e2b36b3d2cac98cdcb97d743d08ca76120159f20cc77800947445a')

build() {
   cd "${srcdir}/${pkgname}-${pkgver}"
   ./configure
   make
}

package() {
   install -D -m755 "${srcdir}/${pkgname}-${pkgver}/src/.libs/${pkgname}.so" "${pkgdir}/usr/lib/httpd/modules/${pkgname}.so"
}
