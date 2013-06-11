# Maintainer: M0Rf30

pkgname=httpcomponents-core-beta
_pkgname=httpcomponents-core
pkgver=4.3
pkgrel=1
pkgdesc="A HTTP/1.1 compliant HTTP agent implementation"
arch=('i686' 'x86_64')
url="http://hc.apache.org/"
license="Apache"
depends=('java-runtime')
conflicts=('httpcomponents-core')
source=(http://www.apache.org/dist/httpcomponents/httpcore/binary/${_pkgname}-${pkgver}-beta2-bin.tar.gz)

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}-beta2"/lib
	mkdir -p ${pkgdir}/usr/share/java/${_pkgname}
	chmod +r *.jar
	cp *.jar $pkgdir/usr/share/java/${_pkgname}
}

md5sums=('017a9815be3dc50865875daf4799516b')
