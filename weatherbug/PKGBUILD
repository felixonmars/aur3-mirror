# Contributor: linuxSEAT <--put_my_name_here--@gmail.com>

pkgname=weatherbug
pkgver=1.0
pkgrel=1
pkgdesc='Live weather conditions and forecasts by WeatherBug'
arch=('i686' 'x86_64')
license=('custom')
url='http://www.weatherbug.com/'
makedepends=('rpmextract')
depends=('java-runtime' 'mesa' 'libxtst' 'libgnomeui')
source=(http://wdownload.weatherbug.com/linux/${pkgname}-${pkgver}-1.rpm
		LICENSE)
md5sums=('5944d9898bf036296961faca2b5642fc'
		 'cbaedbe025753675b360f45dad75e6d4')

build() {
  cd ${srcdir}
  rpmextract.sh ${pkgname}-${pkgver}-1.rpm
  cp -r {usr,etc} ${pkgdir}/
  install -D -m644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}
