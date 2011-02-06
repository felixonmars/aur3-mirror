# Contributor: bsdson (at) gmail (dot) com
# Contributor: jeremie (at) lamah (dot) info
# Maintainer: 
pkgname=l7-filter-userspace
pkgver=0.11
pkgrel=1
pkgdesc="A classifier for Linux's Netfilter that identifies packets based on application layer data"
arch=(i686 x86_64)
url=http://l7-filter.sourceforge.net/
license=(GPL)
depends=(libnetfilter_conntrack libnetfilter_queue)
#makedepends=()
#optdepends=()
#provides=()
#conflicts=()
#replaces=()
#options=('!libtool')
source=(http://downloads.sourceforge.net/l7-filter/$pkgname-$pkgver.tar.gz l7-filter-userspace-0.11.diff netfilter-conntrack-0.100.diff)
md5sums=("ac135b33fc7918bf1b25997bbff00c75" "ecc0a719553f5dee6685f95371a51b1e" "4ec9e2abc38b8b64545d8d75fc9077d9")

build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -p1 < $startdir/l7-filter-userspace-0.11.diff
  patch -p1 < $startdir/netfilter-conntrack-0.100.diff
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
