# Maintainer: Guten Ye

pkgname="openvpn-client-daemon"
pkgver=0.1
pkgrel=2
pkgdesc="an openvpn daemon"
arch=("i686" "x86_64")
url="http://openvpn.net"
license=("MIT")
backup=("etc/conf.d/openvpn-client")
source=("rc.openvpn-client" "conf.openvpn-client")

package() {
  cd "$srcdir"

  install -Dm755 rc.openvpn-client "$pkgdir/etc/rc.d/openvpn-client"
  install -Dm644 conf.openvpn-client "$pkgdir/etc/conf.d/openvpn-client"
}

# vim:set ts=2 sw=2 et:
md5sums=('9026a027168166fdc824cd2fad8ee5c9'
         'af3d61f01b048d48c2ef5922a71c8e8c')
