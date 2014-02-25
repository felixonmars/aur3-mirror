#Autor: Alexandre Minoshi(Almin-Soft Group)
#Maintainer: Alexandre Minoshi

pkgname=systemdx
pkgver=0.17.1
pkgrel=1
pkgdesc="GUI for systemd. Depends neither GTK nor Qt, only X11"
options=('!strip')
arch=('i686' 'x86_64')
url="http://almin-soft.ru/index.php?systemdx"
license=('GPL2')
if [ "${CARCH}" = 'x86_64' ]; then
depends=('ssx' 'libsystemdx>=0.17.1-1' 'lib32-libx11' 'lib32-libxft' 'systemd')
elif [ "${CARCH}" = 'i686' ]; then
depends=('ssx' 'libsystemdx>0.15.0-1' 'libx11' 'libxrender' 'systemd')
fi
source=("http://almin-soft.ru/data/files/systemdx/download.php?get=systemdx.tar.bz2")

package() {
  install -Dm755 systemdx $pkgdir/usr/bin/systemdx
  install -Dm644 systemdx.desktop $pkgdir/usr/share/applications/systemdx.desktop
  install -Dm644 systemdx-tracking-journal.desktop $pkgdir/usr/share/applications/systemdx-tracking-journal.desktop
  install -Dm644 systemdx-udev-monitor.desktop $pkgdir/usr/share/applications/systemdx-udev-monitor.desktop
  install -Dm644 systemdx.png $pkgdir/usr/share/pixmaps/systemdx.png
}
md5sums=('1977b12b15b745269d2c63ea7c8f04f7')
