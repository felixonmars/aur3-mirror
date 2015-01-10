# Maintainer: Andrea Brancaleni <miwaxe@gmail.com>
pkgname=urbanterror-apparmor
pkgver=0.1
pkgrel=1
pkgdesc="Urbanterror Apparmor Profile"
url="http://wiki.apparmor.net/index.php/Main_Page"
arch=('any')
license=('GPLv3')
depends=('apparmor' 'urbanterror')
source=('opt.urbanterror.urbanterror')
md5sums=('a4c5e59fa9639688c1a1be285a8a301b')

package() {
  mkdir -p "$pkgdir/etc/apparmor.d"
  install -Dm600 opt.urbanterror.urbanterror "$pkgdir/etc/apparmor.d/opt.urbanterror.urbanterror"
}

# vim:set ts=2 sw=2 et:
