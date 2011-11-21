# Maintainer: Alucryd <alucryd at gmail dot com>
# Contributor: Ahmed M. Abdellah <a3dman1 at gmail dot com>
pkgname=gnome-shell-theme-faience
pkgver=0.3
pkgrel=2
pkgdesc="A GNOME Shell theme based on Faenza"
url="http://tiheum.deviantart.com/art/Gnome-Shell-Faience-255097456"
license=('GPL3')
arch=('any')
depends=('gnome-shell')
optdepends=('gnome-tweak-tool: Easy theme switcher')
source=("http://www.deviantart.com/download/255097456/gnome_shell___faience_by_tiheum-d47vmgg.zip")
md5sums=('e2ab117a54f05ff4213f5f6a49449eec')

package() {
    cd $srcdir
    mkdir -p $pkgdir/usr/share/themes
    mv Faience $pkgdir/usr/share/themes/
}
