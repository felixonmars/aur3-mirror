pkgname=gnome-shell-theme-min
pkgver=20120816
pkgrel=1
pkgdesc="A minimalistic GNOME Shell theme without bells and whistles."
url="https://github.com/simukis/gnome-shell-theme-min"
license=('GPL3')
arch=('any')
depends=('gnome-shell')
optdepends=('gnome-tweak-tool: Easy theme switcher')
short_hash='c79e451'
source=('https://github.com/simukis/gnome-shell-theme-min/zipball/'$short_hash)
md5sums=('a30fb952983cca310367010d85ec65ac')

package() {
    cd $srcdir/simukis-gnome-shell-theme-min-$short_hash/
    mkdir -p $pkgdir/usr/share/themes/Min/
    mv gnome-shell/ $pkgdir/usr/share/themes/Min/
}
