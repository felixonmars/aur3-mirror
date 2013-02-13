# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

_timestamp=v20130131

pkgname=jetty-hightide
pkgver=8.1.9
pkgrel=1
pkgdesc="An open source web container. It comes pre-integrated with a number of services: JNDI, an XA transaction service, a JMS message fabric, and a JDBC accessible database."
arch=('any')
url="http://jetty.codehaus.org/jetty/"
license=('Apache' 'EPL')
depends=('java-environment' 'logrotate' 'systemd')
makedepends=('libarchive')
conflicts=('jetty')
backup=(etc/default/jetty)
source=(http://dist.codehaus.org/jetty/${pkgname}-${pkgver}/${pkgname}-${pkgver}.${_timestamp}.tar.gz
		jetty.default jetty.logrotate jetty.service setuid.patch shell.patch)
options=(!strip)
install=$pkgname.install
changelog=${pkgname}.ChangeLog.markdown

build() {
	_distribution=${pkgname}-${pkgver}.${_timestamp}

	cd "$srcdir"

	patch -p1 < setuid.patch
	patch -p1 < shell.patch

	rm -r ${_distribution}/bin/*cygwin*
}

package() {
	_distribution=${pkgname}-${pkgver}.${_timestamp}

	install -dm755 "$pkgdir"/opt

	cd "$srcdir"
	
	cp -a ${_distribution} "$pkgdir"/opt/jetty
	install -D -m644 jetty.default "$pkgdir"/etc/default/jetty
	install -D -m644 jetty.logrotate "$pkgdir"/etc/logrotate.d/jetty
	install -D -m644 jetty.service "$pkgdir"/usr/lib/systemd/system/jetty.service
}

md5sums=('e52f29747d9e306f616246e6328350bb'
         '7e6c8973cc1e78ee15c38e618aa341fe'
         '15e8a100480756299e186ec3fc38b25a'
         '770ae57c1e5f4fec7140ad2f4cef0fba'
         '9da3fd644edf3f2b17e6cad7f5fe76ba'
         '01145497bdeef82abd58f82443d09211')
sha256sums=('9f6331f3b8b94ed4b22b2eda116900f66ccb0862eaf46d125a1c0e3577306a8c'
            '8627432a972b9f90f4fbb0fa87726e999c2712e0d0c034913b135fabafb3d7b8'
            'a139babe3f22ff0ccfefbe13e9cd8bd89999ef32d1f519c080bb09be117d527f'
            '867691883c10ac05230109d2108a8ec0885dca484a5a1c729506e30edc361089'
            'f6467eee6251ba8d30333691de01430cc370d67c88517f904771b7893aa141b7'
            'efe6179df18e45a208770d0012c93601eebf4b824882a370cf2625cd1dc6f9ee')
