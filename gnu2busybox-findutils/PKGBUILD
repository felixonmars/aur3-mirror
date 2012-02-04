#Maintainer: Jens Staal <staal1978@gmail.com>

pkgname="gnu2busybox-findutils"
pkgver="1"
pkgrel=1
pkgdesc="Replacing the GNU findutils with the corresponding commands from Busybox"
arch=('any')
url="http://busybox.net/"
license=('GPLv2')
depends=('busybox')
# makedepends=('txt2man') #see below...
provides=('findutils')
conflicts=('findutils')
source=('findutils.ls')
md5sums=('5ef74d381a12b941f3c805b8e6370f6a')

_usrbin=($srcdir/findutils.ls)


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
  ln -s find oldfind

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
 
