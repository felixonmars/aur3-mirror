# Maintainer: Testuser_01 <arch@nico-siebler.de>

pkgname=mod_antiloris
pkgver=0.4
pkgrel=1
pkgdesc="With this module, apache is protected against the slowloris attack. The module limits the number of threads in READ state on a per IP basis."
url="http://mod-antiloris.sourceforge.net/"
arch=('any')
install=("${pkgname}.install")
license=('Apache License V2.0')
depends=('apache>=2.2')
source=("http://downloads.sourceforge.net/project/mod-antiloris/${pkgname}-${pkgver}.tar.bz2")

md5sums=('66862bf10e9be3a023e475604a28a0b4')


build() {
	cd "${srcdir}" || return 1 
	cd ${pkgname}-${pkgver} || return 1
	mkdir -p "${pkgdir}/usr/lib/httpd/modules/" || return 1
	apxs -i -S LIBEXECDIR="${pkgdir}/usr/lib/httpd/modules/" -c "${pkgname}.c" || return 1
}
