# Maintainer: Pradeep Murthy <pradeepmur@gmail.com>
pkgname=cinnamon-applet-netctl-systray-menu
pkgver=2.0
pkgrel=1
epoch=
pkgdesc="This is a cinnamon applet to display netctl status and switch netctl profiles"
arch=('i686' 'x86_64')
url="http://cinnamon-spices.linuxmint.com/applets/view/153"
license=('GPL')
groups=('cinnamon-applets')
depends=('iw' 'iproute2' 'wireless_tools' 'wpa_supplicant' 'xterm' 'gksu' 'cinnamon' 'python2')
install=
source=("http://cinnamon-spices.linuxmint.com/uploads/applets/4XUM-SQ7U-AE1J.zip")

md5sums=('7d34379b1903cfd37819357f2bcaaee3')

package() {
  find netctlsystraymenu\@prmurthy/ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/cinnamon/applets/{}" \;
}
