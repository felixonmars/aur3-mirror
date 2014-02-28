pkgname=2gis-moscow
pkgver=34
pkgrel=1
pkgdesc="Map of Moscow for 2GIS, February 2014"
arch=('i686' 'x86_64')
url="http://msk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Moscow-34.orig.zip")
md5sums=('bd8cb3be945cfb02f5944d2d9cab1981')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Moscow.dgdat" "${pkgdir}/opt/2gis/moscow.dgdat" || return 1
  
}
