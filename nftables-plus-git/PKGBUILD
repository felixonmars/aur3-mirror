#  Maintainer: sudokode <sudokode@gmail.com>
# Contributor: Sébastien Luttringer

pkgname=nftables-plus-git
pkgver=0.099
pkgrel=1
pkgdesc='Netfilter nftables userspace tools improved by Jan Engelhardt'
arch=('i686' 'x86_64')
url='http://xtables.de/'
license=('GPL2')
depends=('libmnl' 'libnftnl' 'gmp' 'readline' 'ncurses')
makedepends=('git')
conflicts=('nftables-plus')
provides=('nftables')
source=("$pkgname::git://git.xtables.de/nftables-plus")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname

  git describe | sed 's/nftables-plus.//'
}

build() {
  cd $pkgname

  ./autogen.sh
  ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc
  make
}

package() {
  cd $pkgname

  mkdir -pm755 "$pkgdir"/etc/nftables-plus
  for f in files/nftables/*; do
    install -Dm644 $f "$pkgdir"/etc/nftables-plus/$f
  done

  install -Dm755 files/examples/sets_and_maps "$pkgdir"/usr/share/docs/nftables-plus/sets_and_maps

  install -Dm755 src/nft "$pkgdir"/usr/bin/nft+

  # for lazy people
  ln -s nft+ "$pkgdir"/usr/bin/nftp
}

# vim:set ts=2 sw=2 et:
