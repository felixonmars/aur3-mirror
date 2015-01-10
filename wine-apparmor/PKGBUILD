# Maintainer: Andrea Brancaleni <miwaxe@gmail.com>
pkgname=wine-apparmor
pkgver=0.1
pkgrel=4
pkgdesc="Wine Apparmor Profile"
arch=('any')
url="http://wiki.apparmor.net/index.php/Main_Page"
license=('GPLv3')
depends=('apparmor' 'wine')
source=('usr.bin.wineserver'
        'usr.bin.wine-preloader')
md5sums=('277abdd58cb0b9383634e74ab7349324'
         '47016ab067bf5bbb88c587eeae4dc277')

package() {
  mkdir -p "$pkgdir/etc/apparmor.d"
  install -Dm600 usr.bin.wine-preloader "$pkgdir/etc/apparmor.d/usr.bin.wine-preloader"
  install -Dm600 usr.bin.wineserver "$pkgdir/etc/apparmor.d/usr.bin.wineserver"
}

# vim:set ts=2 sw=2 et:
