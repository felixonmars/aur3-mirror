# Maintainer: sawako sadako-dev@gmail.com
pkgname=lubuntu-lxde-themes
pkgver=10.10
pkgrel=1
pkgdesc="Lubuntu themes for a prettier LXDE desktop."
arch=('any')
url="https://github.com/sawako/aur-lubuntu-themes"
license=('GPL')
depends=('gtk-engines' 'hicolor-icon-theme' 'gnome-icon-theme' 'lxpanel')
makedepends=()
provides=('elementary-icons')
replaces=('elementary-icons')
source=(https://github.com/downloads/sawako/aur-lubuntu-themes/aur-lubuntu-themes-10.10.tar.bz2)
md5sums=('57331ae69a27fb97cd350d1eff544d1a')

build() {
 cd "$srcdir/"
 mkdir -p "$pkgdir/usr/share/themes/"
 mkdir -p "$pkgdir/usr/share/lxpanel/images/"
 mkdir -p "$pkgdir/usr/share/icons/"
 cp -fR gtk2/* "$pkgdir/usr/share/themes/"
 cp -fR lxpanel/* "$pkgdir/usr/share/lxpanel/images/"
 cp -fR icons/* "$pkgdir/usr/share/icons/"
}