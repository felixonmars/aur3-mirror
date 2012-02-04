# Contributor: Jens Staal <staal1978@gmail.com>

pkgname=gnu2posix2001-coreutils
pkgver=1
pkgrel=3
arch=('i686' 'x86_64')
pkgdesc="A replacement of GNU Coreutils with binaries derived from original UNIX utilities, provided by the Heirloom project"
url="https://wiki.archlinux.org/index.php/Base2heirloom"
license=('custom:"opensolaris"' 'custom:"lucent"')
depends=('busybox')
optdepends=('perl-digest-sha')
makedepends=('heirloom-devtools-cvs' 'heirloom-cvs' 'heirloom-sh-cvs')
provides=('coreutils' 'gnu2heirloom-coreutils')
conflicts=('coreutils')

source=('scripts.tar.gz')

md5sums=('0295e605235674d11daa5dbfc73d8d43')

#Heirloom-variant dependent files below this line. Busybox covers unimplemented functions.
_5bin=($srcdir/scripts/5bin.ls)
_posix=($srcdir/scripts/posix.ls)
_posix2001=($srcdir/scripts/posix2001.ls)
_ucb=($srcdir/scripts/ucb.ls)

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

  msg "move binaries corresponding to a specific Heirloom variant [sysV, posix, posix2001, s42 or ucb]"
  msg "to a single intermediate directory: $srcdir/tmp/bin"

# the build function will be common for all gnu2heirloom packages of a given type
   for i in $(cat $_ucb)
      do
      cp /usr/heirloom/bin/ucb/$i $srcdir/tmp/bin/$i
    done

   for i in $(cat $_5bin)
      do
      cp /usr/heirloom/bin/$i $srcdir/tmp/bin/$i
    done
      cp /usr/heirloom/bin/sh $srcdir/tmp/bin/jsh

   for i in $(cat $_posix)
      do
      cp /usr/heirloom/bin/posix/$i $srcdir/tmp/bin/$i
    done

   for i in $(cat $_posix2001)
      do
      cp /usr/heirloom/bin/posix2001/$i $srcdir/tmp/bin/$i
    done

  msg "copy script files to common binary directory"

   cp $srcdir/scripts/bin/*	$srcdir/tmp/bin/


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

#  chmod 755 $pkgdir/bin/*
#  chmod 755 $pkgdir/usr/bin/*
#  chmod 755 $pkgdir/usr/sbin/*

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
      cp /usr/heirloom/share/man/man1/sh.1 $srcdir/tmp/man/jsh.1
      cp /usr/heirloom/share/man/man1/false.1 $srcdir/tmp/man/false.1
      cp /usr/heirloom/share/man/man1/true.1 $srcdir/tmp/man/true.1

   for i in $(cat $_posix)
      do
      mv $srcdir/tmp/usr/heirloom/share/man/man1/$i.1 $srcdir/tmp/man/$i.1
    done

   for i in $(cat $_posix2001)
      do
      mv $srcdir/tmp/usr/heirloom/share/man/man1/$i.1 $srcdir/tmp/man/$i.1
    done

  cd $srcdir/tmp/man/
  for i in $(cat $_busybox)
      do
      printf "Busybox symlink. Type busybox $i --help for more info" > $i.1
    done

_shavariants=($srcdir/scripts/shavariants)
    for i in $(cat $_shavariants)
      do
      ln -s /usr/share/man/man1/shasum.1p.gz sha${i}sum.1
    done

  ln -s ls.1 dir.1
  ln -s ls.1 vdir.1
  ln -s ln.1 link.1
  ln -s rm.1 unlink.1
  ln -s rm.1 shred.1

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

