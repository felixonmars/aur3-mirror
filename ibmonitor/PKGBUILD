# Maintainer: Rohan Almeida <rohan at almeida dot in>
pkgname=ibmonitor
pkgver=1.4
pkgrel=1
pkgdesc="An interactive console app which shows bandwidth consumed and total data transferred on all network interfaces."
arch=('any')
url="http://ibmonitor.sourceforge.net"
license=('GPL')
depends=('perl-term-readkey')
makedepends=()
install=
source=(http://prdownloads.sourceforge.net/ibmonitor/ibmonitor-1.4.tar.gz?download)
md5sums=('b8522eda27381b4e65eed12bffd8adcd')

package() {
  cd "$srcdir/$pkgname"
  install -m 0755 -D ibmonitor "$pkgdir/usr/bin/ibmonitor"
}

