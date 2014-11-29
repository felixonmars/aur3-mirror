# Maintainer: Srijan Choudhary <srijan4@gmail.com>
# Contributor: Jeffrey Gelens <jgelens@gmail.com>
pkgname=haproxy
pkgver=1.5.9
pkgrel=1
pkgdesc="The Reliable, High Performance TCP/HTTP Load Balancer"
arch=('i686' 'x86_64')
url="http://haproxy.1wt.eu"
license=('GPL')
depends=('pcre' 'openssl' 'zlib')
makedepends=('gcc' 'linux-headers')
backup=('etc/haproxy/haproxy.cfg')
install="${pkgname}.install"
source=(  "http://haproxy.1wt.eu/download/1.5/src/${pkgname}-${pkgver}.tar.gz"
          "haproxy.service" )
md5sums=('b7672bb6a8aa188a655b418f3c96f65c'
         'fb569db966f5e73bcec37b45cf55cd74')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make TARGET=linux2628 CPU=native USE_PCRE=1 USE_OPENSSL=1 USE_ZLIB=1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX="${pkgdir}/usr" SBINDIR="${pkgdir}/usr/bin" DOCDIR="${pkgdir}/usr/share/doc/${pkgname}" install

  install -d "${pkgdir}/usr/share/doc/${pkgname}/examples"
  install -m644 examples/*.cfg "${pkgdir}/usr/share/doc/${pkgname}/examples/"
  install -d "${pkgdir}/usr/share/doc/${pkgname}/examples/errorfiles"
  install -m644 examples/errorfiles/*.http "${pkgdir}/usr/share/doc/${pkgname}/examples/errorfiles/"

  install -D -m644 "examples/haproxy.cfg" "${pkgdir}/etc/haproxy/haproxy.cfg"
  install -D -m644 "${startdir}/haproxy.service" "${pkgdir}/usr/lib/systemd/system/haproxy.service"

}

# vim:ts=2:sw=2:et
