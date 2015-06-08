# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Contributor: Ray Kohler <ataraxia937 at gmail dot com>

pkgname=vpnc-srx
pkgver=0.5
pkgrel=4
pkgdesc="client for Cisco and Juniper VPN concentrators"
arch=('i686' 'x86_64')
url="http://www.unix-ag.uni-kl.de/~massar/vpnc/"
license=('GPL')
depends=('libgcrypt' 'openssl' 'iproute2')
provides=(vpnc)
conflicts=(vpnc)
backup=(etc/vpnc/default.conf)
source=(vpnc.conf)
source=("http://www.nateis.com/vpnc/vpnc-0.5.4beta-20101022-1824.tgz")
md5sums=('da1d7a5ff02eeeda78a5a810ac46b0d2')

build() {
  cd "$srcdir/vpnc-0.5.4beta"

  sed -i -e 's@/sbin@/usr/bin@g' vpnc-script
  
  # Build hybrid support
  sed -i 's|^#OPENSSL|OPENSSL|g' Makefile

  make PREFIX=/usr
}

package() {
  cd "$srcdir/vpnc-0.5.4beta"

  make DESTDIR="$pkgdir" PREFIX=/usr SBINDIR=/usr/bin install

  install -m755 "$srcdir/vpnc-0.5.4beta/vpnc-script" "$pkgdir/etc/vpnc/vpnc-script"
  install -m644 "$srcdir/vpnc-0.5.4beta/vpnc.conf" "$pkgdir/etc/vpnc/default.conf"
  rm -f "$pkgdir/etc/vpnc/vpnc.conf"
}
