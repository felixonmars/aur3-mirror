# Maintainer: SiD / sidious <miste78 at web de>
pkgname=gnome-shell-extension-movehotcorner
pkgver=2.0
pkgrel=2
pkgdesc="Move hot corner to right hand side of monitor"
source=(http://www.fpmurphy.com/gnome-shell-extensions/movehotcorner-${pkgver}.tar.gz)
arch=('any')
url="http://www.fpmurphy.com/gnome-shell-extensions/"
license=('GPL2')
depends=('gnome-shell')

package() {
    cd "$srcdir"
    mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/"
    cp -R "movehotcorner@fpmurphy.com" "$pkgdir/usr/share/gnome-shell/extensions"
}

md5sums=('03a2bd168caba9e3537202bb05395339')
