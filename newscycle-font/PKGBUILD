# Maintainer: Kovivchak Evgen <oneonfire@gmail.com>

pkgname=newscycle-font
pkgver=0.5
pkgrel=1
pkgdesc="Regular weight, covers Latin, Greek, and Cyrillic alphabets, plus mathematical symbols"
arch=(any)
url="https://launchpad.net/newscycle/trunk/"
license=('OFL')
depends=(fontconfig)
install=newscycle-font.install
source=(https://launchpad.net/newscycle/trunk/$pkgver/+download/newscycle-$pkgver.zip)
md5sums=('d16d9c8311c84dd3d03841e9606a0b0d')


package() {
  cd "$srcdir/"
  install -Dm0644 newscycle-bold.ttf $pkgdir/usr/share/fonts/TTF/newscycle-bold.ttf
  install -Dm0644 newscycle-regular.ttf $pkgdir/usr/share/fonts/TTF/newscycle-regular.ttf
}
