# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=xfce4-quickening-icon-theme
pkgver=R4
pkgrel=1
pkgdesc="Dark icons for whom like dark desktop themes"
arch=('any')
url="http://xfce-look.org/content/show.php/The+Quickening+Project?content=46402"
license=('BSD')
source=('http://xfce-look.org/CONTENT/content-files/46402-quickening_r4.tar.gz')
md5sums=('afe42942f75c99e967b0f04fa72c0601')

package() {
 mkdir -p "$pkgdir/usr/share/icons"
 cp -R "$srcdir/Quickening" "$pkgdir/usr/share/icons"
}
