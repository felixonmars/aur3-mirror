# Maintainer: Arnaud Durand-Favreau <biginoz at FREE point FR>


pkgname=dyson
pkgver=1.20
pkgrel=2
pkgdesc="Dyson game "
arch=('i686')
url="http://www.eufloria-game.com/news.php"
license=('GPL')
depends=('mono')
source=( http://www.dyson-game.com/files/dyson120-linux.zip dyson)
md5sums=('657969b778a58fd3fbf95086729869d3'
         '456545f41ce1154a225b79fc2853b9bd')
build() {

  cd $startdir/src/dyson120-linux
  install -d $startdir/pkg/usr/bin && \
  install -m 755 -o 0 -g 0 ../dyson $startdir/pkg/usr/bin
  install -d $startdir/pkg/usr/share/dyson && \
  cp -r * $startdir/pkg/usr/share/dyson
  #for access modification user.settings
  chmod o+rwx $startdir/pkg/usr/share/dyson/Resources
}
