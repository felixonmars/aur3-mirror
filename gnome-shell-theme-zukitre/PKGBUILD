pkgname=gnome-shell-theme-zukitre
pkgver=1.0
pkgrel=1
pkgdesc="Gnome Shell theme inspired by Zukitre GTK+"
arch=('any')
url="http://tgraeca84.deviantart.com/art/Zukitre-Shell-499776227"
license=('GPLv3')
depends=('gnome-shell')
source=("http://fc00.deviantart.net/fs70/f/2014/346/f/3/zukitre_shell_by_tgraeca84-d89jxsz.zip")
sha256sums=('SKIP')

package() {
  install -dm755 ${pkgdir}/usr/share/themes
  cp -r zukitre ${pkgdir}/usr/share/themes
} 
