# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname="xfce4-finalorder-icon-theme"
pkgver="0.6.2"
pkgrel="1"
pkgdesc="Final Order icon theme for XFCE"
arch=("any")
url="http://xfce-look.org/content/show.php/Final+Order?content=65113"
license=("GPL")
source=("https://dl.dropboxusercontent.com/u/24716740/mirror/FinalOrder.tbz")
md5sums=("ef92c3925a8f96ef64146448e96c368f")

package() {
  mkdir -p "$pkgdir/usr/share/icons"
  cp -R "$srcdir/FinalOrder" "$pkgdir/usr/share/icons"
}
