# Maintainer: Heiko Baums <heiko@baums-on-web.de>

pkgname=libdbx
pkgver=1.0.4
pkgrel=3
pkgdesc="Tools and library for reading Outlook Express mailboxes (.dbx format)"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/ol2mbox"
license=('GPL')
source=(http://downloads.sourceforge.net/project/ol2mbox/LibDBX/v$pkgver/$pkgname\_$pkgver.tar.gz)
md5sums=('65e1b1ad93560d9c487cbabb4a558a4e')

build() {
  cd $srcdir
  sed -i "s/-g/${CFLAGS}/" Makefile
  make
}

package () {
  cd $srcdir
  install -D -m755 $srcdir/readoe $pkgdir/usr/bin/readoe
  install -D -m755 $srcdir/readdbx $pkgdir/usr/bin/readdbx
  install -D -m644 $srcdir/libdbx.h $pkgdir/usr/include/libdbx.h
  install -D -m644 $srcdir/libdbx++.h $pkgdir/usr/include/libdbx++.h
  install -D -m644 $srcdir/libdbx.o $pkgdir/usr/lib/libdbx.o
}
