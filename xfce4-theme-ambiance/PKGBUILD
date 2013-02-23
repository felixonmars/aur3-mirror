# Author: Jan Hrdina <jan.hrdka@gmail.com>

pkgname=xfce4-theme-ambiance
pkgver=1.1
pkgrel=2
pkgdesc="Ubuntu Ambiance variation for XFCE"
arch=('any')
url="https://launchpad.net/light-themes/"
license=('CCPL')
depends=("gtk-engine-murrine" "gtk3" "gtk-engine-unico")
source=("http://janhrdka.ic.cz/Dokumenty/XFCEAmbiance-${pkgver}.tar.gz")
md5sums=('d2e1df0ffb8c7bd633098d1eda170704')

build() {
  cd ${srcdir}/XFCEAmbiance-$pkgver
  install -d ${pkgdir}/usr/share/themes/XFCEAmbiance
  cp -rf * ${pkgdir}/usr/share/themes/XFCEAmbiance || return 1
}

