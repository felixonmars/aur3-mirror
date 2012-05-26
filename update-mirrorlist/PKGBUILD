# Maintainer: ushi <martin.kalcher@gmail.com>
pkgname=update-mirrorlist
pkgver=1.0.6
pkgrel=1
pkgdesc="Update tool for pacmans mirrorlist"
arch=(any)
url="https://github.com/ushis/update-mirrorlist"
license=('GPL')
depends=('coreutils' 'curl' 'pacman' 'iputils' 'grep')
backup=('etc/pacman.d/update-mirrorlist.conf')
install=update-mirrorlist.install
source=('update-mirrorlist'
        'update-mirrorlist.conf'
        'makefile')
md5sums=('bdb203936212e6d7ba26f6b1ee304e16'
         'a64a72aeb07f173ede54ff30d42c53fc'
         '090a56e65fafddff46ea5a60a40d84f7')
package() {
  cd "$srcdir"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
