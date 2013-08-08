pkgname=rpglauncher
pkgver=0.1
pkgrel=1
pkgdesc="A utility which extends the functionality of RPG Maker 2k and 2k3 games"
arch=('i686' 'x86_64')
url=http://dreamvsdream.99k.org/
license=('unknown')
source=('https://dl.dropboxusercontent.com/u/5968004/rpglauncher-0.1.tar.gz')
md5sums=('513e6cbb9b4e64e30389c0029d1eec47')
depends=('wine')
optdepends=('rpg2k3-rtp-en: English runtime package')

build() {
  echo "Built"
}

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/share"
  mv "$pkgname-$pkgver/bin" "$pkgdir/usr"
  mv "$pkgname-$pkgver/share" "$pkgdir/usr/share/$pkgname"
}
