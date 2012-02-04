# Contributor: damian01w <damian01w@gmail.com>
pkgname=servicemenu-steghide-kde4
pkgver=0.1
pkgrel=2
pkgdesc="Extends the functionalities of konqueror/dolphin adding some additionally sensible menu. These actions are related to steghide operations."
arch=('i686' 'x86_64')
url="http://www.egregorion.net/2009/05/18/servicemenu-steghide-01-for-kde/"
license=('GPL')
depends=('kdebase>=4.1.0' 'steghide')
md5sums="6ee7640b6c697bcd1207c5df21dd0a75"
source="http://www.egregorion.net/works/servicemenus/servicemenu-steghide_0.1-kde4.tar.gz"

build() {
  tar -xvf ${srcdir}/servicemenu-steghide_$pkgver-kde4.tar.gz
  mkdir -p ${pkgdir}/usr/share/kde4/services/ServiceMenus/
  mkdir -p ${pkgdir}/usr/bin/
  install -m 644 ${srcdir}/servicemenu-steghide_$pkgver-kde4/desktop/*.desktop ${pkgdir}/usr/share/kde4/services/ServiceMenus/
  install -m 755 ${srcdir}/servicemenu-steghide_$pkgver-kde4/bin/*.sh ${pkgdir}/usr/bin/
}

