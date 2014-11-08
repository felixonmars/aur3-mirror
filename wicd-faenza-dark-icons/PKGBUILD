# Maintainer: Diego
# Contributor: flienteen
# Contributor: Diego

pkgname=wicd-faenza-dark-icons
pkgver=0.2.2
pkgrel=3
arch=('any')
pkgdesc="Faenza Dark icons for Wicd Network Manager"
url="http://maththias.deviantart.com/art/Faenza-Wicd-Iconset-183102684"
license=('GNU/GPL')
depends=('wicd-gtk')
source=(https://dl.dropbox.com/s/c8pt1pifwlzb1cj/faenza_wicd_iconset_by_maththias-d310ixo.zip)
md5sums=('80f1430472737af2b3a6593157f0f52e')
install="faenza-wicd-dark.install"

package() {

rm -rf $srcdir/faenza_wicd_iconset_by_maththias-d310ixo.zip
mkdir -p $pkgdir/usr/share/pixmaps/wicd-dark/
cp $srcdir/Faenza\ Wicd\ Icons/dark/24/* $pkgdir/usr/share/pixmaps/wicd-dark/ -Rf


}
