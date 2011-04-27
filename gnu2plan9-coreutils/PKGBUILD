# Contributor: Jens Staal <staal1978@gmail.com>

pkgname=gnu2plan9-coreutils
pkgver=1
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="A replacement of GNU Coreutils with binaries derived from Plan9port and Heirloom (ucb profile)"
url="https://wiki.archlinux.org/index.php/Base2plan9"
license=('custom:"opensolaris"' 'custom:"lucent"')
depends=('busybox')
optdepends=('perl-digest-sha')
makedepends=('plan9port' 'heirloom-devtools-cvs' 'heirloom-cvs')
provides=('coreutils' 'gnu2heirloom-coreutils')
conflicts=('coreutils' 'gnu2busybox-coreutils')

source=('scripts.tar.gz') #collected all custom lists in an archive for clean-ness

md5sums=('c8033e5ef5f930d25d9a559fabd7129b')

#Heirloom-variant dependent files below this line. Busybox covers unimplemented functions.
_5bin=($srcdir/scripts/5bin.ls)
_posix=($srcdir/scripts/posix.ls)
_posix2001=($srcdir/scripts/posix2001.ls)
_ucb=($srcdir/scripts/ucb.ls)
_s42=($srcdir/scripts/s42.ls)
_plan9=($srcdir/scripts/plan9port-bin.ls)

#package-specific file list variables below this line
_busybox=($srcdir/scripts/busybox.ls)
_gnuonly=($srcdir/scripts/coreutils.gnuonly.ls)
_core_bin=($srcdir/scripts/coreutils.bin.ls)
_core_usrbin=($srcdir/scripts/coreutils.usr.bin.ls)
_core_usrsbin=($srcdir/scripts/coreutils.usr.sbin.ls)

build() {
  rm -rf $srcdir/tmp
  mkdir $srcdir/tmp
  mkdir $srcdir/tmp/bin
  mkdir $srcdir/tmp/usr
  mkdir $srcdir/tmp/usr/heirloom
  mkdir $srcdir/tmp/usr/heirloom/share

  msg "Fill up missing binaries for Coreutils using symlinks to Busybox"
    for i in $(cat $_busybox)
      do
      ln -s /bin/busybox $srcdir/tmp/bin/$i
    done

  msg "move Heirloom (ucb profile) and plan9port binaries"
  msg "to a single intermediate directory: $srcdir/tmp/bin"

   for i in $(cat $_5bin)
      do
      cp /usr/heirloom/bin/$i $srcdir/tmp/bin/$i
    done
  
   for i in $(cat $_posix)
      do
      cp /usr/heirloom/bin/posix/$i $srcdir/tmp/bin/$i
    done

   for i in $(cat $_s42)
      do
      cp /usr/heirloom/bin/s42/$i $srcdir/tmp/bin/$i
    done

   for i in $(cat $_posix2001)
      do
      cp /usr/heirloom/bin/posix2001/$i $srcdir/tmp/bin/$i
    done

   for i in $(cat $_ucb)
      do
      cp /usr/heirloom/bin/ucb/$i $srcdir/tmp/bin/$i
    done

   for i in $(cat $_plan9)
      do
      cp -ar /opt/plan9/bin/$i $srcdir/tmp/bin/$i
    done

    cp $srcdir/tmp/bin/unmount $srcdir/tmp/bin/umount

  msg "Add shell scripts for some missing functions"
  cp $srcdir/scripts/bin/* $srcdir/tmp/bin/
}

# The package function is the only thing changing for different packages [coreutils, findutils ...].
package() {
  mkdir $pkgdir/bin
  mkdir $pkgdir/usr
  mkdir $pkgdir/usr/bin
  mkdir $pkgdir/usr/sbin

  msg "moving binaries into a Coreutils tree structure"

    for i in $(cat $_core_bin)
      do
      mv $srcdir/tmp/bin/$i $pkgdir/bin/$i
    done

    for i in $(cat $_core_usrbin)
      do
      mv $srcdir/tmp/bin/$i $pkgdir/usr/bin/$i
    done

    for i in $(cat $_core_usrsbin)
      do
      mv $srcdir/tmp/bin/$i $pkgdir/usr/sbin/$i
    done

  msg "adding corresponding man pages"
  mkdir $pkgdir/usr/share
  mkdir $pkgdir/usr/share/man
  mkdir $pkgdir/usr/share/man/man1
  mkdir $srcdir/tmp/man
# Moving manpages into a common directory
   cp -ar /usr/heirloom/share/man $srcdir/tmp/usr/heirloom/share/man
   mv $srcdir/tmp/usr/heirloom/share/man/man8/catman.8 $srcdir/tmp/usr/heirloom/share/man/man1/catman.1
   mv $srcdir/tmp/usr/heirloom/share/man/man5/fspec.5  $srcdir/tmp/usr/heirloom/share/man/man1/fspec.1
   mv $srcdir/tmp/usr/heirloom/share/man/man1m/mknod.1m $srcdir/tmp/usr/heirloom/share/man/man1/mknod.1
   mv $srcdir/tmp/usr/heirloom/share/man/man1m/sync.1m $srcdir/tmp/usr/heirloom/share/man/man1/sync.1

   for i in $(cat $_ucb)
      do
      mv $srcdir/tmp/usr/heirloom/share/man/man1b/$i.1b $srcdir/tmp/man/$i.1
    done

   for i in $(cat $_5bin)
      do
      mv $srcdir/tmp/usr/heirloom/share/man/man1/$i.1 $srcdir/tmp/man/$i.1
    done
  
   for i in $(cat $_posix)
      do
      mv $srcdir/tmp/usr/heirloom/share/man/man1/$i.1 $srcdir/tmp/man/$i.1
    done

   for i in $(cat $_posix2001)
      do
      mv $srcdir/tmp/usr/heirloom/share/man/man1/$i.1 $srcdir/tmp/man/$i.1
    done

   for i in $(cat $_s42)
      do
      mv $srcdir/tmp/usr/heirloom/share/man/man1/$i.1 $srcdir/tmp/man/$i.1
    done

   for i in $(cat $srcdir/scripts/9man.ls)
      do
      cp /opt/plan9/man/man1/$i $srcdir/tmp/man/$i
    done  

  cd $srcdir/tmp/man/

      printf "Plan9 utility dd, no manpage available" > dd.1
      printf "Plan9 utility du, no manpage available" > du.1
      ln -s sum.1 md5sum.1
      ln -s sum.1 sha1sum.1
      ln -s ls.1 lc.1

_shavariants=($srcdir/scripts/shavariants)
    for i in $(cat $_shavariants)
      do
      ln -s /usr/share/man/man1/shasum.1p.gz sha${i}sum.1
    done

      printf "custom script false, no manpage available" > false.1
      printf "custom script true, no manpage available" > true.1

  for i in $(cat $_busybox)
      do
      printf "Type busybox $i --help for instructions" > $i.1
    done

# Moving the relevant manpages to the package directory
 
  for i in $(cat $_core_bin)
      do
	mv $srcdir/tmp/man/$i.1 $pkgdir/usr/share/man/man1/$i.1
      done

  for i in $(cat $_core_usrbin)
      do
	mv $srcdir/tmp/man/$i.1 $pkgdir/usr/share/man/man1/$i.1
      done

  for i in $(cat $_core_usrsbin)
      do
	mv $srcdir/tmp/man/$i.1 $pkgdir/usr/share/man/man1/$i.1
      done

# It would be cool to substitute su with factotum
  msg "adding system configuration files"
  mkdir $pkgdir/etc
  mkdir $pkgdir/etc/pam.d
  install -m0644 $srcdir/scripts/su $pkgdir/etc/pam.d/su

# locales and the libstdbuf are lacking in both Heirloom and Busybox

  msg "The following coreutils binaries are not covered by Heirloom or Busybox"
  cat $_gnuonly
  msg "A list of missing functionality is saved in /usr/share/info"
  mkdir $pkgdir/usr/share/info
  cp $srcdir/scripts/coreutils.gnuonly.ls $pkgdir/usr/share/info/

  msg "installing Heirloom-specific licence information"
  install -D -m0644 /usr/share/licenses/heirloom-cvs/LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
  install -D -m0644 /usr/share/licenses/heirloom-cvs/OPENSOLARIS.LICENSE $pkgdir/usr/share/licenses/${pkgname}/OPENSOLARIS.LICENSE
  install -D -m0644 /usr/share/licenses/heirloom-cvs/LUCENT $pkgdir/usr/share/licenses/${pkgname}/LUCENT

  msg "WARNING: this package changes fundamental components in your system. DO NOT install on a production system (unless you know what you are doing)"
}

