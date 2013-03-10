# Contributor: crazyelf5
# Maintainer: Pablo Lezaeta <prflr88@gmail.com>

pkgname=osx-icon-theme
pkgver=2012.01.27
pkgrel=2
pkgdesc="A Linux port of the Mac OS X icons"
arch=('any')
url="http://n00b-un-2.deviantart.com/art/OSX-Icon-Theme-for-Gnome-279284710"
license=('GPL')
source=("https://www.deviantart.com/download/279284710/osx_icon_theme_for_gnome_by_n00b_un_2-d4ma1gm.zip")

package() {
  find osx/ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/icons/{}" \;
}

md5sums=('f53d66b46f87d9f4ffb74701a43dd72e')
