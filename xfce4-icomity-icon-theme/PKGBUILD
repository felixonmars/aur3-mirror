# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=xfce4-icomity-icon-theme
pkgver=beta3
pkgrel=1
pkgdesc="iComity icon theme for XFCE"
arch=('any')
url="http://xfce-look.org/content/show.php/iComity?content=54242"
license=('GPL')
source=('http://dl.dropbox.com/u/24716740/mirror/iComity-beta3.tar.bz2')
md5sums=('7bb9b8e065172c9d26c6086a723f1afa')

build() {
 mkdir -p "$pkgdir/usr/share/icons"
 cp -R "$srcdir/iComity" "$pkgdir/usr/share/icons"
}
