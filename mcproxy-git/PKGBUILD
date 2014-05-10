# Maintainer: Tillmann Karras <tilkax@gmail.com>
pkgname=mcproxy-git
pkgver=1.1.0.r203.gbbb2e7e
pkgrel=1
pkgdesc='Multicast proxy for IGMP/MLD (RFC 4605)'
arch=('i686' 'x86_64')
url='http://mcproxy.realmv6.org/'
license=('GPL')
depends=('gcc-libs')
makedepends=('git' 'qt4')
provides=('mcproxy')
conflicts=('mcproxy')
backup=('etc/mcproxy.conf')
source=("$pkgname::git://github.com/mcproxy/mcproxy.git"
        'mcproxy.service')
sha256sums=('SKIP'
            '92a0423f77267012ccc7f90a9d36cbda9496902ac9c87df53c12e9c25b92673f')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname/mcproxy"
  qmake-qt4
  make
}

package() {
  cd "$srcdir/$pkgname/mcproxy"
  install -Dm755 mcproxy "$pkgdir/usr/bin/mcproxy"
  install -Dm644 mcproxy.conf "$pkgdir/etc/mcproxy.conf"
  install -Dm644 ../../mcproxy.service "$pkgdir/usr/lib/systemd/system/mcproxy.service"
}
