# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=prune_dev_bin
pkgver=13
pkgrel=1
pkgdesc="a java application for viewing, editing and converting coordinate data from GPS systems (dev version for testing purposes)"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/prune-gps/"
license=("GPL")
depends=('java-runtime')
optdepends=('java3d' 'povray' 'exiftool' 'gpsbabel' 'gnuplot')
source=("http://activityworkshop.net/software/prune/gpsprune_${pkgver}_test.jar" "http://activityworkshop.net/software/prune/prunelogo.png" "prune.desktop")
install='prune.install'
md5sums=('7cbf905a8bb27ff4fbe3896523c92392'
         '0dce06ef7eec27ecff78eb0a83c0b123'
         'a5e0406c09addef4320ce0c6beff0968')
conflicts=(prune_bin)
noextract=("prune_${pkgver}_test.jar")

build() {
return 0
}

package() {
cd $srcdir
install -D -m644 ./gpsprune_${pkgver}_test.jar $pkgdir/usr/share/java/prune/gpsprune_${pkgver}_test.jar
echo -e "#"'!'"/bin/bash\njava -jar /usr/share/java/prune/gpsprune_${pkgver}_test.jar \"\$@\"" >./gpsprune
install -D -m755 ./gpsprune $pkgdir/usr/bin/gpsprune
install -D -m644 $srcdir/prunelogo.png $pkgdir/usr/share/pixmaps/prune.png
install -D -m644 $srcdir/prune.desktop $pkgdir/usr/share/applications/prune.desktop
}
