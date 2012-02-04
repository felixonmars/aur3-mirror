# Contributor: rabyte <rabyte.at.pen.dot.tj>

pkgname=deutex
pkgver=4.4.0
pkgrel=4
pkgdesc="A WAD file composer for Doom, Heretic, Hexen and Strife"
arch=('i686')
url="http://www.teaser.fr/~amajorel/deutex/"
license=('custom')
source=(http://www.teaser.fr/~amajorel/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('4c4ea0ff9eae76165a3756b756d71a16')

build() {
  cd $startdir/src/$pkgname-$pkgver

  make CFLAGS="${CFLAGS} -Wall" || return 1
  mkdir -p $startdir/pkg/usr/{bin,man/man6}
  make PREFIX=$startdir/pkg/usr install
  install -m644 -D LICENSE $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
}
