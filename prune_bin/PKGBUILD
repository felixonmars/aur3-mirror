# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=prune_bin
pkgver=12.1
pkgrel=1
pkgdesc="a java application for viewing, editing and converting coordinate data from GPS systems"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/prune-gps/"
license=("GPL")
depends=('java-runtime')
optdepends=('java3d' 'povray' 'exiftool' 'gpsbabel' 'gnuplot')
source=("http://activityworkshop.net/software/prune/prune_${pkgver}.jar" "http://activityworkshop.net/software/prune/prunelogo.png" "prune.desktop")
install='prune.install'
md5sums=('582eb711565c59eceae28e2d0f902bd9'
         '0dce06ef7eec27ecff78eb0a83c0b123'
         '93c6f0df93f3dcc42655071bd9fb0c7c')

build() {
return 0
}

package() {
cd $srcdir
install -D -m644 ./prune_${pkgver}.jar $pkgdir/usr/share/java/prune/prune_${pkgver}.jar
echo -e "#"'!'"/bin/bash\njava -jar /usr/share/java/prune/prune_${pkgver}.jar \"\$@\"" >./gpsprune
install -D -m755 ./gpsprune $pkgdir/usr/bin/gpsprune
install -D -m644 $srcdir/prunelogo.png $pkgdir/usr/share/pixmaps/prune.png
install -D -m644 $srcdir/prune.desktop $pkgdir/usr/share/applications/prune.desktop
}
