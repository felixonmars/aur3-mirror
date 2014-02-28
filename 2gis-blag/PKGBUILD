pkgname=2gis-blag
pkgver=29
pkgrel=1
pkgdesc="Map of Blagoveschensk for 2GIS, February 2014"
arch=('i686' 'x86_64')
url="http://blag.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Blagoveshensk-29.orig.zip")
md5sums=('10a5433e806895556ae1d414df8b1906')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Blagoveshensk.dgdat" "${pkgdir}/opt/2gis/blag.dgdat" || return 1
  
}
