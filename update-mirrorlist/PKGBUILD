# Maintainer: ushi <martin.kalcher@gmail.com>
pkgname=update-mirrorlist
pkgver=1.0.3
pkgrel=1
pkgdesc="Update tool for pacmans mirrorlist"
arch=(any)
url="https://github.com/ushis/update-mirrorlist"
license=('GPL')
depends=('coreutils' 'wget' 'pacman' 'iputils' 'grep')
backup=('etc/pacman.d/update-mirrorlist.conf')
install=update-mirrorlist.install
source=('update-mirrorlist'
        'update-mirrorlist.conf'
        'makefile')
md5sums=('8cb707164b19b3028847b7bd088112dc'
         '6edabb841afae61bd4e47eb03295ed0f'
         '090a56e65fafddff46ea5a60a40d84f7')

package() {
  cd "$srcdir"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
