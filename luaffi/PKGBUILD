# $Id: PKGBUILD 93359 2013-07-02 09:43:15Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=luaffi
pkgver=1.0
pkgrel=1
url="https://github.com/jmckaskill/luaffi"
pkgdesc='luajit compatible ffi for Lua 5.2'
arch=('i686' 'x86_64')
license=('MIT')
makedepends=('lua')
source=( "https://codeload.github.com/jmckaskill/luaffi/zip/master")
md5sums=('SKIP')

build() {
  cd $srcdir/luaffi-master
  make
}

package() {
  cd $srcdir/luaffi-master
  mkdir -p $pkgdir/usr/lib/lua/5.2
  cp ffi.so $pkgdir/usr/lib/lua/5.2
}
