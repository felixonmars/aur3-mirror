#Maintainer: Jens Staal <staal1978@gmail.com>

pkgname="gnu2busybox-diffutils"
pkgver="1"
pkgrel=1
pkgdesc="Replacing the GNU diffutils with the corresponding commands from Busybox"
arch=('any')
url="http://busybox.net/"
license=('GPLv2')
depends=('busybox')
# makedepends=('txt2man') #see below...
provides=('diffutils')
conflicts=('diffutils')
source=('diffutils.ls')
md5sums=('5e36e1b9c2fd1dd553aba91fca653a67')

_usrbin=($srcdir/diffutils.ls)


build() {
  
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

  cd $pkgdir/usr/bin
  ln -s diff diff3
  ln -s diff sdiff

  msg "setting up manpage entries"

#Temporarily commented out since I do not get how I should make it work...
#Hardly essential at this stage anyway...
# ideas/feedback welcome

#  _tmp=()
#  for i in $(cat $_usrbin)
#      /bin/busybox $i --help > $_tmp
#      txt2man -t $i -s 1 -v "Busybox symlink" $_tmp > $pkgdir/usr/share/man/man1/$i.1
#  done
}
 
