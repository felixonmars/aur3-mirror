# Maintainer: Faidoc <faidoc at gmail dot com>
pkgname=faenza-hotot-icon
pkgver=1.0
pkgrel=2
pkgdesc="A Faenza-like icon for hotot"
source=('hotot-icon.tar.gz')
md5sums=('c30ecb6b6a12ad4eaea4232b253ddf2b')
arch=('any')
url="http://gnome-look.org/content/show.php?content=134202"
license=('GPL')
depends=('faenza-icon-theme')


package() {
  cd $srcdir
  tar -xzf hotot-icon.tar.gz
  for size in 16 22 24 32 48; do
    mkdir -p "$pkgdir/usr/share/icons/Faenza/apps/$size"
    cp hotot-icon/$size/hotot.png $pkgdir/usr/share/icons/Faenza/apps/$size/hotot.png
  done;
  mkdir -p "$pkgdir/usr/share/icons/Faenza/apps/scalable"
  cp hotot-icon/hotot.svg $pkgdir/usr/share/icons/Faenza/apps/scalable/hotot.svg
}
