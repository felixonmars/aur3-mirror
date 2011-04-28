#Maintainer: Jens Staal <staal1978@gmail.com>

pkgname="gnu2busybox-coreutils"
pkgver="1"
pkgrel=4
pkgdesc="Replacing the GNU coreutils with the corresponding commands from Busybox"
arch=('any')
url="https://wiki.archlinux.org/index.php/Base2busybox"
license=('GPLv2')
depends=('busybox')
optdepends=('perl-digest-sha')
provides=('coreutils')
conflicts=('coreutils')
source=('scripts.tar.gz')
md5sums=('7d580744d46ebf6956898e7ea7812e85')

_bin=($srcdir/scripts/coreutils.bin.ls)
_usrbin=($srcdir/scripts/coreutils.usr.bin.ls)
_usrsbin=($srcdir/scripts/coreutils.usr.sbin.ls)

build() {
  msg "WARNING: this is an experimental package. Do not install on production systems"
  msg "There may be corner cases where the system expect stuff specific for GNU coreutils"
  msg "A list of files not provided by busybox is saved in text format in /usr/share/info"

  msg "creating package directories"
  mkdir "$pkgdir/bin"
  mkdir "$pkgdir/usr"
  mkdir "$pkgdir/usr/bin"
  mkdir "$pkgdir/usr/sbin"
  mkdir "$pkgdir/etc"
  mkdir "$pkgdir/usr/share"
  mkdir "$pkgdir/usr/share/man"
  mkdir "$pkgdir/usr/share/man/man1"
  mkdir "$pkgdir/usr/share/info"

  msg "creating symlinks for /bin"
  cd $pkgdir/bin

    for i in $(cat $_bin)
      do
      ln -s /bin/busybox $pkgdir/bin/$i
    done
    ln -s ls dir
    ln -s ls vdir
    ln -s rm shred

#  msg "copying script files for /bin"
#  cp $srcdir/scripts/bin/* $pkgdir/bin/

  msg "ceating symlinks for /usr/bin"
  cd $pkgdir/usr/bin

    for i in $(cat $_usrbin)
      do
      ln -s /bin/busybox $pkgdir/usr/bin/$i
    done
    ln -s ln link
    ln -s rm unlink

  msg "copying script files for /usr/bin"
  cp $srcdir/scripts/usrbin/* $pkgdir/usr/bin/

  msg "creating symlinks for /usr/sbin"
  cd $pkgdir/usr/sbin

    for i in $(cat $_usrsbin)
      do
      ln -s /bin/busybox $pkgdir/usr/sbin/$i
    done

  msg "adding corresponding coreutils-dependent settings files"
# Do we need to add more privilige rules in this file to get a secure system?
  cp $srcdir/scripts/busybox.conf $pkgdir/etc/busybox.conf

# /usr/lib/libstdbuf.so is not needed since busybox does not provide stdbuf
# alternative solutions welcome

# /usr/share/locale
# todo: setting up locale support for busybox. Not in stock package - can it be added?

  msg "setting up manpage entries"
#future improvement: to get the symlink to jumt to the relevant part of the busybox man

cd $pkgdir/usr/share/man/man1
for i in $(cat $_bin)
  do
  echo "Busybox symlink. For help, type: busybox $i --help" > $i.1
done
      ln -s ls.1 dir.1
      ln -s ls.1 vdir.1
      ln -s rm.1 shred.1

for i in $(cat $_usrbin)
  do
  echo "Busybox symlink. For help, type: busybox $i --help" > $i.1
done
      ln -s ln.1 link.1
      ln -s rm.1 unlink.1

for i in $(cat $_usrsbin)
  do
  echo "Busybox symlink. For help, type: busybox $i --help" > $i.1
done

_shavariants=($srcdir/scripts/shavariants)
    for i in $(cat $_shavariants)
      do
      ln -s /usr/share/man/man1/shasum.1p.gz sha${i}sum.1
    done

  msg "Warning: $(cat $srcdir/scripts/coreutils.gnuonly.ls)"
  msg "copying list of files not provided by busybox to /usr/share/info"
cp $srcdir/scripts/coreutils.gnuonly.ls $pkgdir/usr/share/info/
}
 
