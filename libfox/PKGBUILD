# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=libfox
pkgver=1.6.50
pkgrel=1
pkgdesc="C++ based Toolkit for developing Graphical User Interfaces easily and effectively."
arch=('i686' 'x86_64')
url="http://www.fox-toolkit.org/"
license=('LGPL2.1')
depends=('glu' 'libjpeg-turbo' 'libtiff' 'libxcursor' 'libxft' 'libxi' 'libxrandr')
source=(ftp://ftp.fox-toolkit.org/pub/fox-$pkgver.tar.gz)
md5sums=('f68c2219318ecb0b838387ae85d3220d')

prepare() {
  cd $srcdir/fox-$pkgver
  ./configure --prefix=/usr
}

build() {
  cd $srcdir/fox-$pkgver  
  make
}

package() {
  cd $srcdir/fox-$pkgver
  make DESTDIR=$pkgdir install

  # Remove example programs
  rm $pkgdir/usr/bin/{adie,Adie.stx,calculator,PathFinder,reswrap,shutterbug}
  rm -rf $pkgdir/usr/share/man
}
