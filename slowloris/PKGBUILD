# Maintainer: Testuser_01 <arch@nico-siebler.de>
# Contributor: Testuser_01 <arch@nico-siebler.de>
pkgname='slowloris'
pkgver=0.7
pkgrel=2
pkgdesc="Slowloris HTTP DoS is a tool which is written in perl to test http-server vulnerabilites for connection exhaustion denial of service (DoS) attacks so you can enhance the security of your webserver."
arch=('any')
url='http://ha.ckers.org/slowloris/'
install='slowloris.install'
depends=('perl-io-socket-ssl')
license=('custom:unknown')
source=("http://ha.ckers.org/${pkgname}/${pkgname}.pl")
md5sums=('ba43c68709a67e8e233575641e3c7d17')

build() {
  mkdir -p "${pkgdir}/usr/bin/" || return 1
  install -m755 -D "slowloris.pl" "${pkgdir}/usr/bin/" || return 1
}

