# Contributor: B@rt <bartslootweg@planet.nl>
pkgname=mplinuxman
pkgver=1.4
pkgrel=1
pkgdesc="Utility for MP-Man MP3 players"
url="mplinuxman.sf.net"
license="GPL"
source=(http://heanet.dl.sourceforge.net/sourceforge/$pkgname/$pkgname-source-$pkgver.tar.gz)
md5sums=('c830925640e3df96f5fa4a7f53b04e15')

build() {
  cd $startdir/src/$pkgname
  make
  install -D -m 755 $pkgname $startdir/pkg/usr/bin/$pkgname
}
