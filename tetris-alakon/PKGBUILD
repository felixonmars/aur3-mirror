# Maintainer: Simon Junod <euc.at.lypt.us>

pkgname=tetris-alakon
pkgver=1.3.0
pkgrel=1
pkgdesc='Un clone de Tetris à la con'
arch=('any')
url="http://www.biganon.com"
license=(GPL)
depends=(python2 python2-pygame)
source=("http://www.biganon.com/etc/public/tetris/tetris-alakon-$pkgver.tar.gz")
md5sums=('585b09a9b9043eadd1e2076601c0beb9')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/share/tetris-alakon
  cp tetris-alakon $pkgdir/usr/bin/
  chmod +x $pkgdir/usr/bin/tetris-alakon
  cp ressources/* $pkgdir/usr/share/tetris-alakon
}
