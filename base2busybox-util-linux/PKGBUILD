#Maintainer: Jens Staal <staal1978@gmail.com>

pkgname="base2busybox-util-linux"
pkgver="1"
pkgrel=1
pkgdesc="Replacing the util-linux utilities from Base with symlinks to busybox"
arch=('any')
url="http://busybox.net/"
license=('GPLv2')
depends=('busybox')
# makedepends=('txt2man') #see below...
provides=('util-linux')
conflicts=('util-linux')

source=('busybox.utillinux.bin.ls' 'busybox.utillinux.sbin.ls' \
'busybox.utillinux.usr.bin.ls'  'busybox.utillinux.usr.sbin.ls' 'busybox.missing.ls')

md5sums=('8fcfbcab352ba66bbd14398563fb4b33' '72608f416453e2318b59b64f63445979' \
'42b94baa5c0d4fce5454b72b3af3d09a' '78c6a11bc7ed9c31376ee821a596a204' '8a30088f1dd29c5e73ec2e30f0b4935b')

_bin=($srcdir/busybox.utillinux.bin.ls)
_sbin=($srcdir/busybox.utillinux.sbin.ls)
_usrbin=($srcdir/busybox.utillinux.usr.bin.ls)
_usrsbin=($srcdir/busybox.utillinux.usr.sbin.ls)
_missing=($srcdir/busybox.missing.ls)


build() {
  
  msg "creating package directories"
  mkdir "$pkgdir/bin"
  mkdir "$pkgdir/sbin"
  mkdir "$pkgdir/usr"
  mkdir "$pkgdir/usr/bin"
  mkdir "$pkgdir/usr/sbin"
  mkdir "$pkgdir/usr/share"
  mkdir "$pkgdir/usr/share/getopt"
  mkdir "$pkgdir/usr/share/man"
  mkdir "$pkgdir/usr/share/man/man1"
  mkdir "$pkgdir/var"
  mkdir "$pkgdir/var/lib"
  mkdir "$pkgdir/var/lib/hwclock"

  msg "creating symlinks for binary replacements"

    for i in $(cat $_bin)
      do
      ln -s /bin/busybox $pkgdir/bin/$i
    done

    for i in $(cat $_sbin)
      do
      ln -s /bin/busybox $pkgdir/sbin/$i
    done

    for i in $(cat $_usrbin)
      do
      ln -s /bin/busybox $pkgdir/usr/bin/$i
    done

    for i in $(cat $_usrsbin)
      do
      ln -s /bin/busybox $pkgdir/usr/sbin/$i
    done

# getopt: getopt-parse.ash, getopt-test.ash

  msg "setting up manpage entries"

#Temporarily commented out since I do not get how I should make it work...
#Hardly essential at this stage anyway...
# ideas/feedback welcome

#  _tmp=()
#  for i in $(cat $_usrbin)
#      /bin/busybox $i --help > $_tmp
#      txt2man -t $i -s 1 -v "Busybox symlink" $_tmp > $pkgdir/usr/share/man/man1/$i.1
#  done

  msg "BIG warning! This package has lots of missing corresponding utilities:"
  msg "$(cat $_missing)"
  msg "make sure that it fulfills your needs before you install it, and do not install on production system"
}
 
