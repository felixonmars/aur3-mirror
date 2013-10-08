# Contributor: Nathan Owe.
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=star-alpha
pkgver=1.5.3a01
pkgrel=1
pkgdesc="Most POSIX compliant and fastest known implementation of a tar archiver."
arch=('i686' 'x86_64')
url="http://cdrecord.berlios.de/old/private/star.html"
license=('cddl')
conflicts=('star')
provides=('star')
source=("ftp://ftp.berlios.de/pub/schily/star/alpha/star-$pkgver.tar.bz2")
md5sums=('20c84138ed5099e120c912576184a5da')
depends=('sh' 'acl' 'libcap')

prepare() {
  sed -i -e 's/sbin/bin/' "$srcdir/star-1.5.3/rmt/Makefile"
}

build() {
  cd "$srcdir/star-1.5.3"
  make RUNPATH=-R/usr/lib DEFINSGRP=root GMAKE_NOWARN=true COPTX=-DTRY_EXT2_FS
}

package() {
  cd "$srcdir/star-1.5.3"
  install -d $pkgdir/usr/man
  make INS_BASE="$pkgdir/usr" INS_RBASE="$pkgdir" DEFINSGRP="root" GMAKE_NOWARN=true install
  install -Dm644 COPYING \
    "$pkgdir"/usr/share/licenses/$pkgname/COPYING
  rm $pkgdir/usr/bin/{gnutar,tar,mt}
  cp -r $pkgdir/usr/man $pkgdir/usr/share
  rm -r $pkgdir/usr/man
  cd $pkgdir
  chmod g-w usr usr/{share,include,lib,bin,share/doc}
  # to avoid conflict with package 'dump' ...
  install -Dm755 $pkgdir/usr/bin/rmt $pkgdir/usr/bin/srmt
  install -Dm644 $pkgdir/usr/share/man/man1/rmt.1 \
    $pkgdir/usr/share/man/man1/srmt.1
  rm $pkgdir/usr/share/man/man1/rmt.1
  sed -i 's+/opt/schily/bin/rmt+/usr/bin/srmt+' \
    $pkgdir/usr/share/man/man1/srmt.1
  # and package 'cdrtools'
  rm $pkgdir/usr/bin/rmt $pkgdir/usr/share/man/man5/makefiles.5 \
    $pkgdir/usr/share/man/man5/makerules.5
}
