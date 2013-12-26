# Contributor: matmoser < matmoser at wu dot ac dot at >

pkgname="gedit-rgedit-plugin"
pkgver=0.8.0.2
pkgrel=2
pkgdesc="Rgedit Plugin for Gedit"
url="http://rgedit.sourceforge.net/"
license=("GPL")
arch=('i686' 'x86_64')
depends=('gedit' 'python' 'r' 'vte3')
#install="$pkgname.install"
source=("http://downloads.sourceforge.net/project/rgedit/rgedit-${pkgver}-Gtk3-Python3.tar.bz2")
md5sums=('08f9c473696067d7844e48765f8ede9e')

build() {
    cd "$startdir/src"
    sed -i 's|~/.local/share/gedit/plugins/RCtrl|/usr/lib/gedit/plugins/RCtrl|g' RCtrl.py
    chmod -R 755 RCtrl
}

package() {
    cd "$startdir/src"
    # create target dir
    install -dm 755 $pkgdir/usr/lib/gedit/plugins
    # copy plugin meta file
    install -m 644  RCtrl.plugin $pkgdir/usr/lib/gedit/plugins
    install -m 644  RCtrl.py $pkgdir/usr/lib/gedit/plugins
    # copy everything else to target dir
    cp -r RCtrl $pkgdir/usr/lib/gedit/plugins/
}

