pkgname=2gis-blag
pkgver=27
pkgrel=1
pkgdesc="Map of Blagoveschensk for 2GIS, December 2013"
arch=('i686' 'x86_64')
url="http://blag.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Blagoveshensk-27.orig.zip")
md5sums=('b26f9764b3e3fb6c104d0cfa585f0805')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Blagoveshensk.dgdat" "${pkgdir}/opt/2gis/blag.dgdat" || return 1
  
}
