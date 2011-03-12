# Mantainer: Adrian Berriel <berriel@gmail.com>

pkgname=kdedecor-aurorae-zink
_pkgname=zink
pkgver=0.7
pkgrel=1
pkgdesc="Aurorae theme with minimal window border and a very small titlebar"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/zink+Aurorae?content=120945"
license=('GPL')
depends=('kdebase-workspace>=4.2.91')
source=(http://kde-look.org/CONTENT/content-files/120945-${_pkgname}.tar.gz)
md5sums=('d8298555947de279720a7f3c2b84f3fc')

build() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/apps/aurorae/themes
  tar xfz 120945-${_pkgname}.tar.gz
  cp -rf "zink" ${pkgdir}/usr/share/apps/aurorae/themes
} 
