# $Id$
# Maintainer: Leigh <leigh@archlinux.us>

pkgname=libkexif
pkgver=0.2.5
pkgrel=1
pkgdesc="library for manipulating EXIF information"
arch=(i686 x86_64)
url="http://extragear.kde.org/apps/kipi/"
license=('GPL')
provides=('libkexif')
depends=('kdelibs3' 'libexif')
source=(http://heanet.dl.sourceforge.net/sourceforge/kipi/libkexif-$pkgver.tar.bz2)
md5sums=('a2b933b80deabe57d8515583236ae6ff')
build() {
  cd $startdir/src/libkexif-$pkgver
   ./configure --prefix=/opt/kde --disable-debug
   make || return 1
   make DESTDIR=$startdir/pkg/ install
   # fix pkg-config that it is in main path
   mkdir -p $startdir/pkg/usr/lib/
   mv $startdir/pkg/opt/kde/lib/pkgconfig $startdir/pkg/usr/lib/
 }

