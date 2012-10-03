# Maintainer: Daniel Beecham <daniel@lunix.se>
# Contributor: Jens Staal <staal1978@gmail.com>

options=(!strip)
pkgname="busybox-findutils"
pkgver="1"
pkgrel=2
pkgdesc="Replacing the GNU findutils with the corresponding commands from Busybox"
arch=('any')
url="http://busybox.net/"
license=('GPLv2')
depends=('busybox')
provides=('findutils')
conflicts=('findutils')
source=('findutils.ls')
md5sums=('5ef74d381a12b941f3c805b8e6370f6a')

_usrbin=($srcdir/findutils.ls)


build() {
  # 'oldfind' needs small script wrapper which would run 'find'.
  # It can't be done with symlinks.
  warning "The binary 'oldfind' is not in this package. It's on the TODO-list."
  
  msg "creating package directories"
  mkdir "$pkgdir/usr"
  mkdir "$pkgdir/usr/bin"
  mkdir "$pkgdir/usr/share"
  mkdir "$pkgdir/usr/share/man"
  mkdir "$pkgdir/usr/share/man/man1"

  msg "creating symlinks for /usr/bin"

    for i in $(cat $_usrbin)
      do
      ln -s /bin/busybox $pkgdir/usr/bin/$i
    done
}
 
