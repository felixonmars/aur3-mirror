# Maintainer: Andrea Brancaleni <miwaxe@gmail.com>
pkgname=skype-apparmor
pkgver=0.1
pkgrel=4
pkgdesc="Skype Apparmor Profile"
url="http://wiki.apparmor.net/index.php/Main_Page"
arch=('any')
license=('GPLv3')
depends=('apparmor' 'skype')
source=('usr.bin.skype')
md5sums=('7c8d0ccc6a2b7fb1cef5bcd734ead2ad')

package() {
  mkdir -p "$pkgdir/etc/apparmor.d"
  install -Dm600 usr.bin.skype "$pkgdir/etc/apparmor.d/usr.bin.skype"
}

# vim:set ts=2 sw=2 et:
