# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org

pkgname=terraview
pkgver=313
pkgrel=1
pkgdesc="An application for the visualization and analysis of geographic data, based on the terralib geoprocessing library"
url="http://www.dpi.inpe.br/terraview/index.html"
license="GPL"
depends=('libtiff' 'mysql' 'postgis' 'qt' 'shapelib' 'x-server' 'nas')
makedepends=()
conflicts=()
backup=()
install=
source=(terraview.sh http://www.dpi.inpe.br/terraview/dow/terraView$pkgver.tar.gz $pkgname.desktop)
md5sums=('6eb13da0678dc6fd66aa19372efe6093' '96bc994341c491e62cf4d40bcc818bd0'\
         '79fca613352fb2b18b13ebe2c0855f86')

build() {
  mkdir -p  $startdir/pkg/usr/share/
  cp -r $startdir/src/terraView313 $startdir/pkg/usr/share/terraview
  rm -r $startdir/pkg/usr/share/terraview/doc
  rm -f $startdir/pkg/usr/share/terraview/{gpl.txt,lgpl.txt,CC-GPL-BR.html}

  install -D -m755 ../terraview.sh $startdir/pkg/usr/bin/terraview

  # install some freedesktop.org compatibility
  install -D -m644 $startdir/src/$pkgname.desktop \
      $startdir/pkg/usr/share/applications/$pkgname.desktop
}
# vim:syntax=sh
