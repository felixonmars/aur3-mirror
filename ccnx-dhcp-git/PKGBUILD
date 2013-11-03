# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
_pkgname=ccnx-dhcp
pkgname=${_pkgname}-git
pkgver=7.7230db2
pkgrel=3
pkgdesc="DCHP-like server & client to setup faces for ccnx"
arch=('i686' 'x86_64')
url="https://github.com/lutostag/ccnx-dhcp"
license=('GPLv2' 'LGPLv2.1')
depends=('ccnx')
makedepends=('git')
provides=('ccnx-dhcp')
options=('zipman')
source=("${_pkgname}::git+https://github.com/lutostag/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/$_pkgname"
  make CCNX_DIR=/usr
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 ccndhcpnode $pkgdir/usr/bin/ccndhcpnode
  install -Dm755 ccndhcpserver $pkgdir/usr/bin/ccndhcpserver
  install -Dm644 ccn_dhcp_server.conf $pkgdir/etc/ccnx-dhcp/ccn_dhcp_server.conf
  install -Dm644 ccn_dhcp_client.conf $pkgdir/etc/ccnx-dhcp/ccn_dhcp_client.conf
  install -Dm644 README $pkgdir/usr/share/ccnx-dhcp/README
} 
# vim:set ts=2 sw=2 et:
