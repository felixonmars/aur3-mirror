# Maintainer: Vladimir Krivopalov <vladimir.krivopalov@gmail.com>
pkgname=sockstress-util
pkgver=1.0
pkgrel=2
epoch=
pkgdesc="C++ utility used to attack servers on the Internet and other networks utilizing TCP protocol pecularities."
arch=('i686' 'x86_64')
url="https://defuse.ca/sockstress.htm"
license=('unknown')
depends=('glibc')
provides=('sockstress')
source=("https://defuse.ca/source/sockstress.tar.gz")
md5sums=('3847107d91a1a87b2de0cb865bd03aa4')

build() {
  cd "$srcdir/sockstress"
  make
}

package() {
  cd "$srcdir/sockstress"
  mkdir -p "$pkgdir/usr/bin/"
  cp sockstress "$pkgdir/usr/bin/"
  echo "You must also stop your OS from sending RST packets to the victim in response to unrecognized SYN/ACKs sent during the attack. To do so, set an iptables rule:"
  echo "    # iptables -A OUTPUT -p TCP --tcp-flags rst rst -d xx.xx.xx.xx -j DROP"
  echo "Where xx.xx.xx.xx is the victim's IP address."
}

# vim:set ts=2 sw=2 et:
