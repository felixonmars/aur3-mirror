# $Id$
# Maintainer: Heiher <admin@heiher.info>

pkgname=connect-proxy
pkgver=1.101
pkgrel=1
pkgdesc="Establish TCP connection using SOCKS4/5 or HTTP tunnel"
arch=('i686' 'x86_64')
url="http://bitbucket.org/gotoh/connect/"
license=('GPL2')
depends=('glibc')
options=('!libtool')
source=(${pkgname}-${pkgver}.tar.gz)
sha256sums=('02c7d3866f131b9931c82895a186603eff56fda146543f67adbbc6d9b6f54c3b')

build() {
  cd "$pkgname-$pkgver"
  
  gcc ${CFLAGS} ${LDFLAGS} -o connect connect.c
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 connect "$pkgdir/usr/bin/connect"
}
