# Maintainer: Ellis Kenyo < elken dot tdos at gmail dot com>
pkgname=wxwidgets
pkgver=3.0.1
pkgrel=1
pkgdesc="A C++ library that lets developers create applications for Windows, OS X, Linux and UNIX."
arch=('x86_64' 'i686')
url="http://www.wxwidgets.org/downloads/"
license=('LGPL')
source=("http://downloads.sourceforge.net/sourceforge/wxwindows/wxWidgets-$pkgver.tar.bz2")
md5sums=('dad1f1cd9d4c370cbc22700dc492da31')

build() {
  cd "$srcdir/wxWidgets-$pkgver"

  ./configure
  make
}

package() {
  cd "$srcdir/wxWidgets-$pkgver"

  make DESTDIR="$pkgdir/" install
}
