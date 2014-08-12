# Maintainer: kfgz <kfgz at interia pl>
# Contributor: Tehacjusz Flovus (thc_flow) <flow at krolnet dot pl>

pkgname=2ping
pkgver=2.1.1
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Bi-directional ping utility"
url="http://www.finnie.org/software/2ping/"
license=('GPL')
depends=('perl' 'perl-digest-sha1' 'perl-digest-hmac')
makedepends=('pkgconfig')
optdepends=('perl-io-socket-inet6: IPv6 support')
source=(http://www.finnie.org/software/2ping/${pkgname}-${pkgver}.tar.gz)
md5sums=('be43490cf4b4d2ceab479653d364c1fb')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  perl Makefile.PL
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  install -D -m755 script/2ping "${pkgdir}"/usr/bin/2ping
  install -D -m644 blib/man1/2ping.1p "${pkgdir}"/usr/share/man/man1/2ping.1
}
