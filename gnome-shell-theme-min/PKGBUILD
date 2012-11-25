pkgname=gnome-shell-theme-min
pkgver=20121102
pkgrel=1
pkgdesc="A minimalistic GNOME Shell theme without bells and whistles."
url="https://github.com/simukis/gnome-shell-theme-min"
license=('GPL3')
arch=('any')
depends=('gnome-shell')
optdepends=('gnome-tweak-tool: Easy theme switcher')
short_hash='a55640e'
source=('https://github.com/simukis/gnome-shell-theme-min/zipball/'$short_hash)
md5sums=('1758a8c7eae7113cc2cb9bea6ef9cc30')

package() {
    cd $srcdir/simukis-gnome-shell-theme-min-$short_hash/
    mkdir -p $pkgdir/usr/share/themes/Min/
    mv gnome-shell/ $pkgdir/usr/share/themes/Min/
}
