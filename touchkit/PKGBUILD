# Contributor: Tyler

pkgname=touchkit
pkgver=2.01
pkgrel=1
pkgdesc="eGalax touchscreen driver"
arch=('i686')
license=()
url="http://moho.frihost.net/dta/?page_id=194"
depends=('glib2' 'libxi' 'fontconfig' 'libxinerama' 'libpng' 'libxcursor' 'libsm' 'libxrandr')
source=(http://moho.frihost.net/dta/wp-content/uploads/TouchKit-2.01.1512-32b-k26-x14.tar.gz)
md5sums=('ac85ab1090339dff8c1bb4041db1e394')

build() {
  cd "$startdir/src/TouchKit_x14"
  install -Dm755 egalax_drv.so $startdir/pkg/usr/lib/xorg/modules/input/egalax_drv.so
  install -Dm755 TouchKit $startdir/pkg/usr/bin/TouchKit
}
