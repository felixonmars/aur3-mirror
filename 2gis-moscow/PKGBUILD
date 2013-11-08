pkgname=2gis-moscow
pkgver=31
pkgrel=1
pkgdesc="Map of Moscow for 2GIS, November 2013"
arch=('i686' 'x86_64')
url="http://msk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Moscow-31.orig.zip")
md5sums=('60e19fdc3c7cc84c505e3a6094bd4f3e')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Moscow.dgdat" "${pkgdir}/opt/2gis/moscow.dgdat" || return 1
  
}
