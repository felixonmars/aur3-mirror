# Maintainer: Gustavo Castro <gustawho[at]gmail[dot]com>

pkgname=darkness-burg-theme
pkgver=1.0
pkgrel=1
pkgdesc="A dark minimal theme based on Lightness. Has got two variants Darkness (white colors) and Darkness Blue (blue colors)."
arch=('any')
url="http://luxieblack.deviantart.com/art/Darkness-BURG-theme-322981112"
license=('CC BY-NC-SA')
depends=('burg-bios-bzr')
makedepends=('git')
source=('git+https://github.com/gustawho/darkness-burg-theme.git')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  install -d -m 755 $pkgdir/boot/burg/themes
  cp -r $srcdir/$pkgname/$pkgname $pkgdir/boot/burg/themes
  cp -r $srcdir/$pkgname/darkness-blue-burg-theme $pkgdir/boot/burg/themes
}

