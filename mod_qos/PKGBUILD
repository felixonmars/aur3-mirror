# Maintainer: Testuser_01 <arch@nico-siebler.de>

pkgname=mod_qos
pkgver=10.9
pkgrel=1
pkgdesc="mod_qos is a Quality-of-Service (QoS) module for the Apache HTTP server implementing control mechanisms that can provide different priority to different requests."
url="http://opensource.adnovum.ch/${pkgname}/"
arch=('any')
install="${pkgname}.install"
license=('GPL')
depends=('apache>=2.2' 'openssl' 'pcre' 'mod_parp')
source=(
	"http://downloads.sourceforge.net/project/mod-qos/${pkgname}-${pkgver}.tar.gz"
	"${pkgname}.conf"	
)

md5sums=('2ecd7c53a583c1cecee9d6b9d9a5b58c'
         '4497faf588116fb27780e61655658e4d')
sha512sums=('d66ebc2feb082ffd3cfdc668467a1fd97409ea5c81f4d9daa8b823769da2c77fadf0bdc5de1fc8e20fb1e595048bc88aeced7b512d4318e5350b4c511701a7a4'
            '40a1844ac0b7a5b2275e4cec4927e694a5d757ad2435572c6cb95ff4de691b955d5f218ad8d5868be2f0cef6fe4f313875c59377fbfcd5c47bff7a0064d82c09')


build() {
	cd "${srcdir}" || return 1 
	cd ${pkgname}-${pkgver}/apache2 || return 1
        mkdir -p "${pkgdir}/usr/lib/httpd/modules/" || return 1
        apxs -i -S LIBEXECDIR="${pkgdir}/usr/lib/httpd/modules/" -c "${pkgname}.c" || return 1
        mkdir -p "${pkgdir}/etc/httpd/conf/extra/" || return 1
	install -m0644 -D "${startdir}/${pkgname}.conf" "${pkgdir}/etc/httpd/conf/extra/" || return 1	
}
