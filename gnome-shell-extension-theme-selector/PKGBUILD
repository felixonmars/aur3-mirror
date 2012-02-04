# Maintainer: Alucryd <alucryd@gmail.com>
pkgname=gnome-shell-extension-theme-selector
pkgver=0.9
pkgrel=1
pkgdesc="A gnome-shell extension that adds a Themes tab in the overview"
source=('http://www.fpmurphy.com/gnome-shell-extensions/themeselector-0.9.tar.gz')
md5sums=('61640cfdc9ad1a418b18d6be195705f5')
arch=('any')
url="http://www.fpmurphy.com/gnome-shell-extensions/"
license=('GPL2')
depends=('gnome-shell' 'gnome-shell-extension-user-theme')
install=('gschemas.install')

package() {
    cd "$srcdir"
    mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/themeselector@fpmurphy.com"
    sed -i 's/border: 2px solid red; border-radius: 8px/border: 0px solid red; border-radius: 8px/g' extension.js
    sed -i 's/const THUMBNAIL_WIDTH = 128/const THUMBNAIL_WIDTH = 512/g' extension.js
    sed -i 's/const THUMBNAIL_HEIGHT = 96/const THUMBNAIL_HEIGHT = 384/g' extension.js
    cp {extension.js,metadata.json} "$pkgdir/usr/share/gnome-shell/extensions/themeselector@fpmurphy.com"
}

