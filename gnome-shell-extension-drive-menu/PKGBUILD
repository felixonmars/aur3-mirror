# Submitter: Gen2ly <toddrpartridge@gmail.com>

pkgname=gnome-shell-extension-drive-menu
pkgver=3.60
pkgrel=1
pkgdesc="A status menu for accessing and unmounting removable devices"
arch=('any')
url="https://extensions.gnome.org/extension/7/removable-drive-menu/"
license=('GPL' 'LGPL')
depends=('gnome-shell')
conflicts=('gnome-shell-extension-drive-menu-git')
source=('drive-menu_3.60.tar.xz')
noextract=('drive-menu_3.60.tar.xz')
md5sums=('01e8b4d1bb7bba0767187c87a368b246')

package() {
  bsdtar -xf drive-menu_3.60.tar.xz -C "$pkgdir"
}
