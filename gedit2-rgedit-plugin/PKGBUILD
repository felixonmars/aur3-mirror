# Contributor: matmoser < matmoser at wu dot ac dot at >

pkgname="gedit2-rgedit-plugin"
pkgver=0.7.1.0
pkgrel=1
pkgdesc="Rgedit Plugin for Gedit 2"
url="http://rgedit.sourceforge.net/"
license=("GPL")
arch=('i686' 'x86_64')
depends=('gedit' 'python2' 'r')
install="$pkgname.install"
source=("http://downloads.sf.net/rgedit/rgedit-$pkgver.tar.bz2")

build() {
        # create target dir
    install -dm 755 $startdir/pkg/usr/lib/gedit-2/plugins
    # copy plugin meta file
    install -m 644  $startdir/src/RCtrl.gedit-plugin $startdir/pkg/usr/lib/gedit-2/plugins
    install -m 644  $startdir/src/RCtrl.py $startdir/pkg/usr/lib/gedit-2/plugins
    # copy everything else to target dir
    cp -r $startdir/src/RCtrl $startdir/pkg/usr/lib/gedit-2/plugins
}
md5sums=('87ae1727a0c5cd854bb888448643ead9')

