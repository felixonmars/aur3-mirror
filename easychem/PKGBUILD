# Contributor: Sergio Vergara <arkanox@gmail.com>
pkgname=easychem
pkgver=0.6
pkgrel=1
pkgdesc="EasyChem is a program designed to draw chemical molecules, written under Linux and using Gtk+2"
url="http://easychem.sourceforge.net/"
license="GPL"
depends=('gtk2')
install=
source=(http://voxel.dl.sourceforge.net/sourceforge/easychem/$pkgname-$pkgver.tar.gz)
md5sums=('e3c9a7fb7807b6abc592a3472a65d969')
build() {
  cd $startdir/src/$pkgname-$pkgver
  mv Makefile.linux Makefile

  make || return 1
  mkdir -p $startdir/pkg/usr/bin
  mv easychem $startdir/pkg/usr/bin
}
