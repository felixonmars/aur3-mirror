# Maintainer: kfgz <kfgz at interia pl>
# Contributor: Tehacjusz Flovus (thc_flow) <flow at krolnet dot pl>

pkgname=2ping
pkgver=1.2
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Bi-directional ping utility"
url="http://www.finnie.org/software/2ping/"
license=('GPL')
depends=('perl>=5.6.0' 'perl-digest-sha1' 'perl-digest-hmac')
makedepends=('pkgconfig')
optdepends=('perl-io-socket-inet6: IPv6 support')
source=(http://www.finnie.org/software/2ping/${pkgname}-${pkgver}.tar.gz)
md5sums=('6c94df3b3b4de6b76212cfc47398931d')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make PREFIX="${pkgdir}"/usr install
}
