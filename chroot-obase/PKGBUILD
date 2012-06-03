 
# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=chroot-obase
pkgver=20120601
pkgrel=1
pkgdesc="Scripts to enter the OpenBSD userland ported to Linux as root + obase chroot binary"
arch=('i686' 'x86_64')
url="https://github.com/chneukirchen/obase/"
#url="http://www.openbsd.org/"
license=('BSD')
depends=('obase-git')
makedepends=('cvs' 'openssh' 'bmake')
sources=('chroot-obase' 'makefile.patch')
md5sums=('f4a4b474f1947833a4da37b8d7e781bc' '831bf0a49b9f3b782691d3a2caef502e')
options=(!strip)

__cvsroot="anoncvs@anoncvs1.ca.openbsd.org:/cvs"
__cvsmod="chroot"

build() {
  cd $srcdir
  CVS_RSH=ssh cvs -d $__cvsroot get -P src/usr.sbin/$__cvsmod

  rm -rf build
  cp -ar $srcdir/src/usr.sbin/$__cvsmod build
  cd $srcdir/build
msg "patching makefile"
  patch -p0 Makefile $startdir/makefile.patch
  bmake
}

package() {
msg "generating directories that are missing in obase"
# these are the Linux directories. Perhaps a couple of them could be removed?
  mkdir -p $pkgdir/opt/obase/{sys,proc,dev,var,srv,tmp,opt,home,boot,run,mnt,media}
  mkdir -p $pkgdir/usr/sbin
  export DESTDIR=$pkgdir/opt/obase
  cd $srcdir/build
  export PATH=/opt/obase/bin:/opt/obase/usr/bin:$PATH
  bmake install
msg "fixing install location of chroot binary"
  mkdir -p $pkgdir/opt/obase/usr/sbin
  mv $DESTDIR/chroot $pkgdir/opt/obase/usr/sbin/
msg "installing host chroot script"
  install -m0755 $startdir/chroot-obase $pkgdir/usr/sbin/
}
