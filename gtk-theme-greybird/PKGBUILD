# Maintainer: Federico Damián <federicodamians@gmail.com>
#
# PKGBUILD for Greybird GTK Theme
#
# forked form original PKGBUILD: xfce-theme-greybird
#

pkgname=gtk-theme-greybird
pkgver=1.5.3
pkgrel=1
pkgdesc="A GTK theme from the Shimmer Project."
arch=(any)
url=http://shimmerproject.org/projects/greybird/
license=("GPL")
depends=(gtk-engine-murrine)
source=(xfce-theme-greybird-$pkgver.tar.gz::https://github.com/shimmerproject/Greybird/archive/v$pkgver.tar.gz)
sha512sums=('SKIP')

package() {
    local _themedir="$pkgdir/usr/share/themes"
    install -d "$_themedir/Greybird "{Classic,Compact}

    cp -rf Greybird-$pkgver/ "$_themedir"/Greybird/
    rm "$_themedir"/Greybird/.gitignore
    ln -s /usr/share/themes/Greybird/xfwm4_compact "$_themedir/Greybird Compact/xfwm4"
}
