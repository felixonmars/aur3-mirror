# Maintainer: Testuser_01 <arch@nico-siebler.de>

pkgname=mod_parp
pkgver=0.12
pkgrel=1
pkgdesc="A POST/GET parameter parser to enable apache modules to validate form parameter send from client."
url="http://parp.sourceforge.net/"
arch=('any')
install="${pkgname}.install"
license=('Apache License V2.0')
depends=('apache>=2.2')
source=(
	"http://downloads.sourceforge.net/project/parp/${pkgname}-${pkgver}-src.tar.gz"
	"${pkgname}.conf"	
)

md5sums=('931f70ba2e53543d103bf2273b6f32d4'
         'c77ce0ffcc4b60a05dd5a0ffc1f3b6ef')
sha512sums=('01f2fed24dc246d9c26d7be8b4651a56e9a3f4e9e441e8dfb9754562a6803ac251f29e433c1f92839ae09d17fc3221ce4081aecbc0d88bcb755f46e7a8a610ad'
            'e997972864a498f49316c66279a50146079ec804a4958efd8069f6a5ce1db8a2ed93fa6866aa2478b35540814a41e2f85f48c2195ba3372ff3f0a74bd92377e2')


build() {
	cd "${srcdir}" || return 1 
	cd ${pkgname}-${pkgver}/apache2 || return 1
        mkdir -p "${pkgdir}/usr/lib/httpd/modules/" || return 1
        apxs -i -S LIBEXECDIR="${pkgdir}/usr/lib/httpd/modules/" -c "${pkgname}.c" || return 1
        mkdir -p "${pkgdir}/etc/httpd/conf/extra/" || return 1
	install -m0644 -D "${startdir}/${pkgname}.conf" "${pkgdir}/etc/httpd/conf/extra/" || return 1	
}
