# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=gtk-murrina-black-theme
pkgver=0.4
pkgrel=2
pkgdesc="Black theme for Murrine gtk engine"
arch=('any')
url="http://xfce-look.org/content/show.php/Murrina-Black?content=46287"
license=('GPL')
depends=('gtk-engine-murrine')
source=("http://xfce-look.org/CONTENT/content-files/46287-Murrina-Black.tar.gz")
md5sums=('f697165f77ae8795359b7e22a440f5c7')

package() {
 install -Dm 644 "$srcdir/Murrina-Black/gtk-2.0/gtkrc" "$pkgdir/usr/share/themes/Murrina-Black/gtk-2.0/gtkrc"
}
