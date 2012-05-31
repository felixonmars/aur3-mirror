# Maintainer: Romain Schmitz <myself at slopjong dot de>

pkgname=stubgen
pkgver=2.8
pkgrel=1
pkgdesc="Creates implementation stubs from C++ headers."
arch=('i686' 'x86_64')
url="http://www.radwin.org/michael/projects/stubgen/"
license=('BSD')
depends=('make' 'flex' 'bison')
source=(http://www.radwin.org/michael/projects/stubgen/dist/stubgen-2.08.tar.gz)
md5sums=('a07677fcc3f49c63dd33ef70b79850e9')

build() {
  cd $srcdir/stubgen-2.08
  make
 }
 
 package() {
  cd $srcdir/stubgen-2.08
  mkdir -p $pkgdir/usr/{bin,share/stubgen}
  mv stubgen $pkgdir/usr/bin
  mv ChangeLog $pkgdir/usr/share/stubgen
  mv README $pkgdir/usr/share/stubgen
 }