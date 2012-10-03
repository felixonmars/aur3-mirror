# Maintainer: Daniel Beecham <daniel@lunix.se>
# Contributor: Jens Staal <staal1978@gmail.com>

options=(!strip)
pkgname="busybox-diffutils"
pkgver="1"
pkgrel=1
pkgdesc="Replacing the GNU diffutils with the corresponding commands from Busybox"
arch=('any')
url="http://busybox.net/"
license=('GPLv2')
depends=('busybox')
provides=('diffutils')
conflicts=('diffutils')
source=('diffutils.ls')
md5sums=('5e36e1b9c2fd1dd553aba91fca653a67')

_usrbin=($srcdir/diffutils.ls)


build() {
  # diff3 and sdiff need script wrappers. Symlinks does not work.
  warning "diff3 and sdiff binaries are not in this package. They are on the todo-list."
  
  msg "creating package directories"
  mkdir "$pkgdir/usr"
  mkdir "$pkgdir/usr/bin"

  msg "creating symlinks for /usr/bin"
  for i in $(cat $_usrbin); do
    ln -s /bin/busybox $pkgdir/usr/bin/$i
  done
}
