pkgname=gnome-shell-theme-ciliora-secunda
pkgver=1.0
pkgrel=1
pkgdesc="Ciliora Secunda GNOME Shell theme."
arch=('any')
url="http://zagortenay333.deviantart.com/art/Ciliora-Secunda-Shell-495066314"
license=('GPLv3')
depends=('gnome-shell')
source=('http://fc08.deviantart.net/fs71/f/2014/351/5/a/ciliora_secunda_shell_by_zagortenay333-d86qzm2.zip')
sha256sums=('SKIP')

package() {
  install -dm755 ${pkgdir}/usr/share/themes
  cp -r ciliora-secunda/Ciliora-Secunda* ${pkgdir}/usr/share/themes
} 
