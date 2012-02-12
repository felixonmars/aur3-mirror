# Maintainer: ushi <martin.kalcher@gmail.com>
pkgname=update-mirrorlist
pkgver=1.0
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
md5sums=('321174d656e9d92678c09937411f3ae5'
         'b13a7e783d0a84ea75704b6f4f8ce57c'
         '090a56e65fafddff46ea5a60a40d84f7')

package() {
  cd "$srcdir"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
