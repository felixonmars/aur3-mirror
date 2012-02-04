# Contributor: pumbur <pumbur@ya.ru>
# Maintainer: François Lebigre <francois.lebigre@gmail.com>
pkgname=gtk-theme-lucidity
pkgver=0.7
pkgrel=3
pkgdesc="A murrine based gtk theme based off of a mockup by Huw Wilkins"
arch=('any')
url="http://gnome-look.org/content/show.php/Lucidity?content=119885"
license=('CCPL-by-nc-sa')
depends=('gtk-engine-murrine-git')
conflicts=('gnome-theme-lucidity')
optdepends=('humanity-icons: default iconset')
source=(http://gnome-look.org/CONTENT/content-files/119885-Lucidity-0.7.tar.gz)
md5sums=('26c01917063abdc023ed3b146ca82d04')

build() {
  tar -xvzf "$srcdir/Lucidity-$pkgver/Lucidity.tar.gz"
  tar -xvzf "$srcdir/Lucidity-$pkgver/Lucidity Border.tar.gz"
  tar -xvzf "$srcdir/Lucidity-$pkgver/Lucidity-Squared.tar.gz"
}

package() {
  mkdir -p $pkgdir/usr/share/themes
  cp -r "$srcdir/Lucidity/" $pkgdir/usr/share/themes
  cp -r "$srcdir/Lucidity Border/" $pkgdir/usr/share/themes
  cp -r "$srcdir/Lucidity-Squared/" $pkgdir/usr/share/themes
}
