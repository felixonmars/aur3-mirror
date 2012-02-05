# Maintainer: Keshto <keshto@gmail.com>
pkgname=gnome-shell-extension-move-clock
pkgver=2.0
pkgrel=1
pkgdesc="A gnome-shell extension from frippery to move the clock/calendar to the status area"
source=('http://www.fpmurphy.com/gnome-shell-extensions/moveclock-2.0.tar.gz')
md5sums=('6e16b3d0e923df72c8df739e322aec3b')
arch=('any')
url="http://www.fpmurphy.com/gnome-shell-extensions/"
license=('GPL2')
depends=('gnome-shell')

package() {
    cd "$srcdir"
    mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/"
    chmod +r moveclock@fpmurphy.com/metadata.json
    cp -R "moveclock@fpmurphy.com" "$pkgdir/usr/share/gnome-shell/extensions"
}

