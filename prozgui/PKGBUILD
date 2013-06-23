# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=prozgui
pkgver=2.0.7
pkgrel=2
pkgdesc="FLTK-based Multithreaded Download Accelerator."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/prozgui/"
license=('GPL3')
depends=('fltk')
options=(!libtool)
source=(http://sourceforge.net/code-snapshots/svn/p/pr/prozgui/svn/prozgui-svn-6.zip)
md5sums=('e1986aa914ef9b2dd7b79a90eaf80d49')

prepare() {
  cd $srcdir/prozgui-svn-6/prozgui-2.0.7
  ./configure --prefix=/usr
}

build() {
  cd $srcdir/prozgui-svn-6/prozgui-2.0.7
  make
}

package() {
  cd $srcdir/prozgui-svn-6/prozgui-2.0.7
  make DESTDIR=$pkgdir install

  # Remove obsolete library header files  
  rm -rf $pkgdir/usr/include
}