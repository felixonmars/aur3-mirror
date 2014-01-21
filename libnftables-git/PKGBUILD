# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=libnftables-git
pkgver=r306.2307124
pkgrel=1
pkgdesc='Netfilter nf_tables infrastructure library'
arch=(i686 x86_64)
url='http://netfilter.org/projects/nftables/'
license=(GPL2)
depends=(libmnl)
makedepends=(git)
source=(git://git.netfilter.org/libnftables)
sha1sums=('SKIP')

pkgver() {
  cd libnftables
  # repo does not have any git tags yet
  echo r$(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd libnftables
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

check() {
  cd libnftables
  make check
}

package() {
  cd libnftables
  make DESTDIR="$pkgdir" install
}
