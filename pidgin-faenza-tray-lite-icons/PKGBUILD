# Maintainer : Oliver Sherouse <oliver DOT sherouse AT gmail DOT com>
# Contributor: SpepS <dreamspepser at yahoo dot it>, H.Gökhan Sarı <hsa2@difuzyon.net>

pkgname=pidgin-faenza-tray-lite-icons
pkgver=0.1
pkgrel=1
pkgdesc="Pidgin panel icons for Faenza"
arch=('any')
url="http://opendesktop.org/content/show.php/Faenza+Pidgin?content=137966"
license=('GPL')
depends=('pidgin')
optdepends=('faenza-icon-theme: Faenza icon theme')
conflicts=('pidgin-faenza-tray-dark-icons' 'pidgin-elementary-tray-icons' 'pidgin-monochrome-tray-icons')
source=("pidgin-faenza.zip::http://ubuntuone.com/p/133X/")
md5sums=('dd2a1501b6ce07ce4a905c4f2336537a')
build() {
  return 0
}

package() {
  cd "$srcdir/lite"

  install -d "$pkgdir/usr/share/pixmaps/pidgin/tray/Faenza/"
  cp -a 16x16 22x22 "$pkgdir/usr/share/pixmaps/pidgin/tray/Faenza/"
}

# vim:set ts=2 sw=2 et:
