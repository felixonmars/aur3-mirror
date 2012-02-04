# Maintainer: Alucryd <alucryd at gmail dot com>
pkgname=faenza-clementine-icon
pkgver=1.0
pkgrel=1
pkgdesc="A Faenza-like icon for clementine"
source=('http://www.deviantart.com/download/184551528/faenza_variants_by_spg76-d31vkvc.zip')
md5sums=('93114ad51b7a97d5ed52642ae9617843')
arch=('any')
url="http://spg76.deviantart.com/art/Faenza-Variants-184551528"
license=('GPL')
depends=('faenza-icon-theme')
install=('icon.install')

package() {
  cd $srcdir
  tar -xzf Faenza-Variants.tar.gz
  for size in 16 22 24 32 48; do
    mkdir -p "$pkgdir/usr/share/icons/Faenza/apps/$size"
    mv Faenza-Variants/apps/$size/clementine.png $pkgdir/usr/share/icons/Faenza/apps/$size/application-x-clementine.png
  done;
  mkdir -p "$pkgdir/usr/share/icons/Faenza/apps/scalable"
  mv Faenza-Variants/apps/scalable/clementine.svg $pkgdir/usr/share/icons/Faenza/apps/scalable/application-x-clementine.svg
}

