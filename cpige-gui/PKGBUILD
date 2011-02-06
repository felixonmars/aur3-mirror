# Contributor: Nathan Owe <ndowens04 at gmail>
pkgname=cpige-gui
pkgver=1.5
pkgrel=1
pkgdesc="gui for cpige"
arch=('i686')
url="http://ed.zehome.com/?page=cpige-en"
license=('GPL')
depends=('gtk2')
source=(http://ed.zehome.com/cpige/cpige-$pkgver.tar.gz)
md5sums=('ad5b8f70d254a261cfb3fda586d66448') 

build() {
  cd $srcdir/cpige-$pkgver/gui/
  ./configure --prefix=/usr
  make || return 1
 install -d $pkgdir/usr/{bin,share/$pkgname}
 install  *.c *.h *.png *.po *.ico cpigeGUI $pkgdir/usr/share/$pkgname/
 install -m755 cpigeGUI $pkgdir/usr/bin/
}

# vim:set ts=2 sw=2 et:
