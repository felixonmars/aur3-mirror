# Maintainer: Martin Blumenstingl <martin.blumenstingl [AT] googlemail.com> 

pkgname=munin-openvpn-git
pkgver=20120610.f7910b7
pkgrel=1
pkgdesc="A munin plugin that provides various graphs for users connected via OpenVPN."
arch=('any')
url="https://github.com/jforman/munin-openvpn"
depends=('munin-node')
makedepends=('git')
license=('GPL')
source=("$pkgname"::'git://github.com/jforman/munin-openvpn.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"

  # Use a date as prefix as long as no tags is available.
  printf 20120610.

  # Use the tag of the last commit
  git describe --always --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$pkgname"
  installdir="$pkgdir/usr/lib/munin/plugins/"
  mkdir -p "$installdir"
  install -Dm744 openvpn_usercount "${installdir}"
  install -Dm744 openvpn_usertransfer "${installdir}"
}