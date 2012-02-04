# Contributor: Jakub Luzny <limoto94@gmail.com>
pkgname=x86info
pkgver=1.30
pkgrel=1
pkgdesc='A CPU identification utility. Provides more info than /proc/cpuinfo.'
arch=(i686 x86_64)
url="http://www.codemonkey.org.uk/projects/x86info/"
license=('GPL')
install=x86info.install
source=(http://www.codemonkey.org.uk/projects/${pkgname}/${pkgname}-${pkgver}.tgz)
md5sums=('8e49b5e08e82fe6b64cac99d50139ccf')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	
	sed 's|python|python2|g' -i Makefile
	
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	
	gzip -9 -f x86info.1 lsmsr.8
	
	mkdir -p "${pkgdir}/usr/bin"
	install -Dm 775 x86info lsmsr "${pkgdir}/usr/bin/"
	install -Dm 644 x86info.1.gz "${pkgdir}/usr/share/man/man1/x86info.1.gz"
	install -Dm 644 lsmsr.8.gz "${pkgdir}/usr/share/man/man8/lsmsr.8.gz"
}

#category: system
# vim:set ts=2 sw=2 et:
