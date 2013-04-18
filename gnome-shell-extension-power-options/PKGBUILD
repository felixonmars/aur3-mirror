# Maintainer: bzeghers <bzeghers@gmail.com>
pkgname=gnome-shell-extension-power-options
pkgver=3.6.0
pkgrel=1
pkgdesc="A gnome-shell extension to display Hibernate and Power Off in user menu"
source=('http://www.fpmurphy.com/gnome-shell-extensions/poweroptions-3.6.0.tar.gz')
md5sums=('534cac448ce4b639a896266e05b3111d') 
arch=('any')
url="http://www.fpmurphy.com/gnome-shell-extensions/"
license=('GPL2')
depends=('gnome-shell')

package() {
    cd "$srcdir"
    mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/"
    chmod +r poweroptions@fpmurphy.com/metadata.json
    cp -R "poweroptions@fpmurphy.com" "$pkgdir/usr/share/gnome-shell/extensions"
}

