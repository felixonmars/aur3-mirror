# Author: Jan Hrdina <jan.hrdka@gmail.com>

pkgname=mdm-theme-wooden
pkgver=1.0
pkgrel=1
pkgdesc="MDM theme with wooden floor as background"
arch=('any')
url="http://gnome-look.org/content/show.php/Wooden?content=90685"
license=('GPL')
depends=("mdm")
source=("http://janhrdka.ic.cz/Dokumenty/wooden.tar.gz")
md5sums=('253871ef249a2c93f445ef9d442ca338')

build() {
  cd ${srcdir}/wooden
  install -d ${pkgdir}/usr/share/mdm/themes/wooden
  cp -rf * ${pkgdir}/usr/share/mdm/themes/wooden || return 1
}

