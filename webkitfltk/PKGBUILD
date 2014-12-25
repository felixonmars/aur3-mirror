# Maintainer: boenki <boenki at gmx dot de>

pkgname=webkitfltk
pkgver=0.2
pkgrel=1
pkgdesc="Port of Webkit to FLTK 1.3"
arch=('i686' 'x86_64')
url="http://fifth-browser.sourceforge.net"
license=('GPL3')
makedepends=('gperf' 'ruby' 'fltk' 'sqlite')
options=(staticlibs)
source=($pkgname-$pkgver.tar.gz::https://github.com/clbr/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('39524cfe79c56334d7c8af673d95cf24')

build() {
  cd "$pkgname-$pkgver"
  make -C Source/WTF/wtf
  make -C Source/JavaScriptCore gen
  make -C Source/JavaScriptCore
  make -C Source/WebCore
  make -C Source/WebKit/fltk
}

package() {
  cd "$pkgname-$pkgver"
  make -C Source/WebKit/fltk DESTDIR=$pkgdir install
}
