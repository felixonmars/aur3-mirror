# Maintainer: XZS <d.f.fischer at web dot de>
pkgname=xpra-systemd
pkgver=1
pkgrel=1
pkgdesc="user services to start displays"
arch=('any')
url="https://wiki.archlinux.org/index.php/Xpra#Start_at_boot"
license=('GPLv3')
depends=('xpra-winswitch' 'systemd')
source=('xpra@.service'
        'xpra-client@.service')
md5sums=('64b2d9e10e07fc839db40dff2be6e139'
         'cdf6a2256823bdee173dc9d2ff9d0cb5')

package() {
  destdir="$pkgdir/usr/lib/systemd/user/"
  install -d "$destdir"
  install -m 644 ${source[@]} "$destdir"
}
