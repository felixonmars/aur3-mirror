# Maintainer: Carl George <carl@carlgeorge.us>

pkgname=dyne-theme
pkgver=0.2
pkgrel=1
pkgdesc='A grey theme for GTK3, GTK2, and Openbox.'
arch=('any')
url='http://thrynk.deviantart.com/art/Dyne-Gtk3-312674772'
license=('GPL')
depends=('gtk-engines' 'gnome-themes-standard' 'gtk-engine-unico')
conflicts=('gtk2-theme-dyne' 'openbox-dyne-theme')
source=('http://fc05.deviantart.net/fs70/f/2012/188/4/7/dyne_gtk3_by_thrynk-d565pec.zip')
sha256sums=('166f402ee8bc097bf5ba8fb0e6cc1834b4a1c05aa707b9ca359acc0c43e706f0')

prepare() {
    find ${srcdir} -type d ! -perm 755 -exec chmod 755 {} +
    find ${srcdir} -type f ! -perm 644 -exec chmod 644 {} +
}

package() {
    install -dm 755 ${pkgdir}/usr/share/themes
    cp -dr --no-preserve=ownership ${srcdir}/Dyne ${pkgdir}/usr/share/themes/Dyne
}
