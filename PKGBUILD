# Maintainer: Testuser_01 <arch@nico-siebler.de>

pkgname=mod_qos
pkgver=9.57
pkgrel=1
pkgdesc="mod_qos is a Quality-of-Service (QoS) module for the Apache HTTP server implementing control mechanisms that can provide different priority to different requests."
url="http://opensource.adnovum.ch/${pkgname}/"
arch=('any')
install=("${pkgname}.install")
license=('GPL')
depends=('apache>=2.2' 'openssl' 'pcre' 'mod_parp')
source=("http://downloads.sourceforge.net/project/mod-qos/${pkgname}-${pkgver}.tar.gz")

md5sums=('6e9f7a5cf5710f9a12d1d3fb83423acb')


build() {
	cd "${srcdir}" || return 1 
	cd ${pkgname}-${pkgver}/apache2 || return 1
	apxs -c "${pkgname}.c" || return 1
	install -D -m 0775 ".libs/${pkgname}.so" "${pkgdir}/usr/lib/httpd/modules/${pkgname}.so" || return 1
}
