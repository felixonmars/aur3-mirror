# Maintainer: H.Gökhan Sarı <hsa2@difuzyon.net>
pkgname=pidgin-faenza-tray-icons
pkgver=0.1
pkgrel=1
pkgdesc="Pidgin panel icons for Faenza."
arch=('any')
url="http://opendesktop.org/content/show.php/Faenza+Pidgin?content=137966"
license=('GPL')
depends=('pidgin')
optdepends=('faenza-icon-theme: Faenza icon theme')
conflicts=('pidgin-faenza-dark-tray-icons' 'pidgin-elementary-tray-icons' 'pidgin-monochrome-tray-icons')
source=('faenza-pidgin.tar.gz')
md5sums=('c44fbf76fe48798fc015ad26cd6b5bf7')
install="faenza-pidgin.install"

build() {
  mkdir -p "$pkgdir/usr/share/pixmaps/pidgin/tray/hicolor/"
  
  cp -Rf "$srcdir/faenza-pidgin/lite/16x16/" "$pkgdir/usr/share/pixmaps/pidgin/tray/hicolor/"
  cp -Rf "$srcdir/faenza-pidgin/lite/22x22/" "$pkgdir/usr/share/pixmaps/pidgin/tray/hicolor/"
}

# vim:set ts=2 sw=2 et:
