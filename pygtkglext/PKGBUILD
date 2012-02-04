# Contributor: Diego Sanches <slipkd at gmail.com>

pkgname=pygtkglext
pkgver=1.1.0
pkgrel=1
pkgdesc="PyGtkGLExt is Python language bindings for GtkGLExt, OpenGL Extension to GTK"
depends=(gtkglext pyopengl)
url="http://gtkglext.sourceforge.net/"
arch=('i686' 'x86_64')
source=(http://downloads.sourceforge.net/gtkglext/$pkgname-$pkgver.tar.bz2)
license="LGPL"
md5sums=('720b421d3b8514a40189b285dd91de57')
 
build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install

  find $startdir/pkg -name '*.la' -exec rm {} \; 
}

