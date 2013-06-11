# Maintainer: M0Rf30

pkgname=httpcomponents-client-beta
_pkgname=httpcomponents-client
pkgver=4.3
pkgrel=1
pkgdesc="A HTTP/1.1 compliant HTTP agent implementation"
arch=('i686' 'x86_64')
url="http://hc.apache.org/"
license="Apache"
depends=('java-runtime')
conflicts=('httpcomponents-client')
source=(http://www.apache.org/dist/httpcomponents/httpclient/binary/${_pkgname}-${pkgver}-beta1-bin.tar.gz)

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}-beta1"/lib
	mkdir -p ${pkgdir}/usr/share/java/${_pkgname}
	chmod +r *.jar
	cp *.jar $pkgdir/usr/share/java/${_pkgname}
}

md5sums=('c3a19e6f9ce20296f868ae2896520c90')
