# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: H.Gökhan Sarı <hsa2@difuzyon.net>

pkgname=pidgin-faenza-tray-dark-icons
pkgver=0.1
pkgrel=4
pkgdesc="Pidgin panel icons for Faenza (dark)"
arch=('any')
url="http://opendesktop.org/content/show.php/Faenza+Pidgin?content=137966"
license=('GPL')
depends=('pidgin')
optdepends=('faenza-icon-theme: Faenza icon theme')
conflicts=('pidgin-faenza-dark-tray-icons' 'pidgin-elementary-tray-icons' 'pidgin-monochrome-tray-icons')
source=("pidgin-faenza-dark.zip::http://ubuntuone.com/p/133Z/")    # randomly resolves to zip or gzip, bad
md5sums=('94d8b2f3616f8cd70850637f40dffa13')                       # md5 for zip (now resolves on zip)
#source=("pidgin-faenza-dark.zip::http://91.189.89.205/p/133Z")    # 205 goes to zip
#md5sums=('94d8b2f3616f8cd70850637f40dffa13')                      # md5 for zip
#source=("pidgin-faenza-dark.tar.gz::http://91.189.89.204/p/133Z") # 204 goes to gzip
#md5sums=('3a772d6995284ef6340ee467c78b5610')                      # md5 for gzip

build() {
  return 0
}

package() {
  cd "$srcdir/dark"

  install -d "$pkgdir/usr/share/pixmaps/pidgin/tray/Faenza/"
  cp -a 16x16 22x22 "$pkgdir/usr/share/pixmaps/pidgin/tray/Faenza/"
}

# vim:set ts=2 sw=2 et:
