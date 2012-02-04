# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=(cecilia)
pkgver=2.0.5
pkgrel=1
pkgdesc="Cecilia is a graphic user interface for the sound synthesis and sound processing package Csound."
arch=('i686' 'x86_64')
url="http://cecilia.sourceforge.net/"
license=('GPL')
depends=('csound5' 'tcl' 'tk')
optdepends=('sox')
source=(http://downloads.sourceforge.net/project/cecilia/cecilia-src/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('0544e4cb36201521469c80454999834d')

build() {
  cd $srcdir/$pkgname-$pkgver
  
 # Infinite Loop Fix
 sed  -e "184,197d" \
      -e "199d" \
      -i lib/prefs.tcl || return 1

  sed "s_/usr/local_$pkgdir/usr_" -i Makefile || return 1

  mkdir -p $pkgdir/usr/bin || return 1

  make install || return 1
}

