pkgname=gnome-shell-theme-holo
pkgver=20120518
pkgrel=1
pkgdesc="A GNOME Shell theme from tiheum, the Faenza icon set creator. Gnome-Shell 3.4"
url="https://github.com/r3gis3r/Holo-Gnome3-Theme"
license=('GPL3')
arch=('any')
depends=('gnome-shell')
optdepends=('gnome-tweak-tool: Easy theme switcher')
source=('https://github.com/r3gis3r/Holo-Gnome3-Theme/zipball/cc45fdf5b36dc39995683ad880c2352fb976c600')
md5sums=('c0ddcf4dec6987989b8b04400766c609')

package() {
    cd $srcdir/*Holo-Gnome3-Theme*/
    mkdir -p $pkgdir/usr/share/themes/Holo/
    mv gnome-shell/ $pkgdir/usr/share/themes/Holo/
}
