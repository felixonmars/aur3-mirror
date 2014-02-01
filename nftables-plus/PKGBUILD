#  Maintainer: sudokode <sudokode@gmail.com>
# Contributor: Sébastien Luttringer

pkgname=nftables-plus
pkgver=0.099
pkgrel=1
pkgdesc='Netfilter nftables userspace tools improved by Jan Engelhardt'
arch=('i686' 'x86_64')
url='http://xtables.de/'
license=('GPL2')
depends=('libmnl' 'libnftnl' 'gmp' 'readline' 'ncurses')
conflicts=('nftables-plus-git')
provides=('nftables')
source=("http://xtables.de/files/nftables-plus-${pkgver}.tar.xz")
sha256sums=('cd3b9ef99b15f4b3d9f2299847a947e50a5fcea9a97748d6fd1f8f139e96adf3')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr \
              --sbindir=/usr/bin \
              --sysconfdir=/etc
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install

  mv "$pkgdir"/etc/nftables "$pkgdir"/etc/nftables-plus
  mv "$pkgdir"/usr/bin/nft "$pkgdir"/usr/bin/nft+

  # for lazy people
  ln -s nft+ "$pkgdir"/usr/bin/nftp
}

# vim:set ts=2 sw=2 et:
