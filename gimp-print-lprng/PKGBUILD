# $Id: PKGBUILD 13772 2008-09-28 14:48:47Z allan $
# Maintainer: arjan <arjan@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
pkgname=gimp-print-lprng
pkgver=4.2.7
pkgrel=2
pkgdesc="Top quality printer drivers for POSIX systems"
arch=('i686' 'x86_64')
depends=('readline')
conflicts=('cups' 'gimp-print' 'ghostscript')
source=(http://downloads.sourceforge.net/gimp-print/gimp-print-4.2.7.tar.gz)
url="http://gimp-print.sourceforge.net/"
license=('GPL')
md5sums=('766be49f44a6a682d857e5aefec414d4')

build() {
  cd $startdir/src/gimp-print-$pkgver
  ./configure --prefix=/usr --with-samples=no --without-gimp \
  --without-translated-ppds --without-cups
   make || return 1
  mkdir -p $startdir/pkg/usr/lib/gimp/1.2/plug-ins
  make DESTDIR=$startdir/pkg install
  find $startdir/pkg -name '*.la' -exec rm {} \;
}

