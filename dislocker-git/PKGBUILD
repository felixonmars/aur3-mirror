# Maintainer: boppbo <boris.bopp at gmail dot com>

pkgname=dislocker-git
pkgver=202
pkgrel=2
pkgdesc="Read BitLocker encrypted volumes under Linux"
arch=('i686' 'x86_64')
url="http://www.hsc.fr/ressources/outils/dislocker"
license=('GPL2')
source=('dislocker::git+https://github.com/Aorimn/dislocker.git')
depends=('fuse' 'polarssl')
optdepends=('ntfs-3g: NTFS file system support')
makedepends=('git')
conflicts=('dislocker')
provides=('dislocker')
md5sums=('SKIP')

build() {
  cd dislocker/src
  make all
}

package() {
  cd dislocker/src
  mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/lib" "$pkgdir/usr/share/man/man1"
  make DESTDIR="$pkgdir/usr" install
}

pkgver() {
  cd dislocker
  echo $(git rev-list --count master)
}
