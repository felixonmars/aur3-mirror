# Maintainer: moostik <mooostik_at_gmail.com>

pkgname=gnome-thumbnailer-geogebra
pkgver=1.0
pkgrel=2
pkgdesc="GNOME thumbnailer for GeoGebra"
arch=('any')
url="http://www.geogebra.org/en/wiki/index.php/GeoGebra_in_Linux"
license=('CCPL:cc-by-sa-3.0') 
depends=('gconf' 'unzip' 'imagemagick')
install='gnome-thumbnailer-geogebra.install'
source=("ggthumb.sh") 
md5sums=('bd878597c4d199ecab8bfd94179df03a')

package() {
  cd "${srcdir}"
  install -D -m755 ggthumb.sh "${pkgdir}/usr/bin/ggthumb"
}
