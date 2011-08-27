# Contributor: Douglas Thrift <douglas@douglasthrift.net>
pkgname=metacity-theme-microgui
pkgver=1.0
pkgrel=1
pkgdesc="The microGUI Sawfish theme for Metacity"
url="http://themes.freshmeat.net/projects/mcitymicrogui/"
makedepends=('findutils')
depends=('metacity')
source=(http://download.freshmeat.net/themes/mcitymicrogui/mcitymicrogui-default.tar.gz)
md5sums=('e80d728c28348300587c43d635291261')

build() {
  cd $startdir/src
  find microGUI -type f -exec install -D -m 0644 '{}' \
    "$startdir/pkg/opt/gnome/share/themes/{}" ';'
}
