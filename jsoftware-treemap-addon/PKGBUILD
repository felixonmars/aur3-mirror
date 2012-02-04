# Contributor: Lorenzo Tomei <tomeil@tiscali.it>

pkgname=jsoftware-treemap-addon
pkgver=1.0.2
pkgrel=2
pkgdesc="treemap class for J programming language"
arch=('any')
url="http://www.jsoftware.com"
license=('custom:jsoftware')
depends=('jsoftware')
source=(http://www.jsoftware.com/jal/j602/addons/graphics_treemap_${pkgver}_linux.tar.gz)
md5sums=('514e2cf2dbc265b6a7b4db3d97afb979')

build() {
  cd $startdir/src
  mkdir -p $startdir/pkg/usr/lib/j/addons
  cp -a graphics $startdir/pkg/usr/lib/j/addons/
}
