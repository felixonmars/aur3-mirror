# Maintainer: daniel g. siegel <dgsiegel@gmail.com>
pkgname="pgmfindclip"
pkgver="1.13"
pkgrel=1
pkgdesc="Automatically find a clipping border for a sequence of pgm images"
depends=()
source=(http://www.lallafa.de/bp/files/$pkgname-$pkgver.tgz)

url="http://www.lallafa.de/bp/pgmfindclip.html"
md5sums=('887bbd7c4d4a3c5685d26d5c449b3c91')

build() {
  cd $startdir/src/
  make || return 1
  install -D -m755 $startdir/src/pgmfindclip $startdir/pkg/usr/bin/pgmfindclip
}
