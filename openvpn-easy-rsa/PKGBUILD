pkgname=openvpn-easy-rsa
pkgver=2.2.2
pkgrel=1
pkgdesc="A small RSA key management package that comes with OpenVPN"
url="http://openvpn.net/"
license="GPL"
depends=(bash openssl)
makedepends=()
conflicts=()
replaces=()
backup=()
install=
arch=(i686 x86_64)
source=(http://swupdate.openvpn.org/community/releases/openvpn-${pkgver}.tar.gz)
md5sums=('c5181e27b7945fa6276d21873329c5c7')

build() {
  tar xvfz $startdir/src/openvpn-${pkgver}.tar.gz -C $startdir/src/

  cd $startdir/src/openvpn-${pkgver}/easy-rsa
  mkdir -p $startdir/pkg/usr/share/doc/openvpn/examples/easy-rsa
  cp -a 2.0/* $startdir/pkg/usr/share/doc/openvpn/examples/easy-rsa
}
