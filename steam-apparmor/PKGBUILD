# Maintainer: Andrea Brancaleni <miwaxe@gmail.com>
pkgname=steam-apparmor
pkgver=0.1
pkgrel=2
pkgdesc="Steam Apparmor Profile"
url="http://wiki.apparmor.net/index.php/Main_Page"
arch=('any')
license=('GPLv3')
depends=('apparmor' 'steam') 
source=('usr.bin.steam')
md5sums=('f641f10f75c6353456fa38779d3f52fa')

package() {
  mkdir -p "$pkgdir/etc/apparmor.d"
  install -Dm600 usr.bin.steam "$pkgdir/etc/apparmor.d/usr.bin.steam"
}

# vim:set ts=2 sw=2 et:
