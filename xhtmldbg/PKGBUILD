pkgname=xhtmldbg
pkgver=0.8.2.rc3
pkgrel=1
pkgdesc="Website Debugger for Linux"
arch=('i686' 'x86_64')
url="http://qtidy.hjcms.de/"
license=('GPL3')
depends=('qt>=4.6' 'libqtidy' 'oxygen-icons>=4.4')
makedepends=('make' 'cmake')
source=(http://qtidy.hjcms.de/Downloads/xhtmldbg-$pkgver.tar.bz2)
md5sums=('a6ffe04e2dd2841133b45faffb3b23a1')
build() {
  cd $srcdir/xhtmldbg-$pkgver
  mkdir build && cd build
  cmake .. || return 1
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
}
