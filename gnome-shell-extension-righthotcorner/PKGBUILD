# Maintainer: SiD / sidious <miste78 at web de>
pkgname=gnome-shell-extension-righthotcorner
pkgver=1.0
pkgrel=1
pkgdesc="Adds an extra hot corner at upper right of your monitor"
source=(http://www.fpmurphy.com/gnome-shell-extensions/righthotcorner-${pkgver}.tar.gz)
arch=('any')
url="http://www.fpmurphy.com/gnome-shell-extensions/"
license=('GPL2')
depends=('gnome-shell')

package() {
    cd "$srcdir"
    mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/"
    cp -R "righthotcorner@fpmurphy.com" "$pkgdir/usr/share/gnome-shell/extensions"
}

md5sums=('ff64aa340bb01b1ba5a537714da6fe52')
