# Maintainer: Alucryd <alucryd@gmail.com>
pkgname=gnome-shell-extension-activities-button
pkgver=1.0
pkgrel=1
pkgdesc="A gnome-shell extension to add the distributor logo beside the Activities button"
source=('http://www.fpmurphy.com/gnome-shell-extensions/activitiesbutton.tar.gz')
md5sums=('388cc5731440970eb45837e2abfdd1d1')
arch=('any')
url="http://www.fpmurphy.com/gnome-shell-extensions/"
license=('GPL2')
depends=('gnome-shell')
install=('preferences.install')

package() {
    cd "$srcdir"
    mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/"
    cp -R "activitiesbutton@fpmurphy.com" "$pkgdir/usr/share/gnome-shell/extensions"
}

