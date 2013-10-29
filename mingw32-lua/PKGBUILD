# Maintainer: Mikael Eriksson <mikael_miffe_eriksson@yahoo.se3

pkgname=mingw32-lua 
pkgver=5.2.2
pkgrel=2
pkgdesc="A powerful light-weight programming language designed for extending applications. (mingw32)" 
arch=('any')
url="http://www.lua.org/" 
depends=() 
depends=('mingw32-runtime')
makedepends=('mingw32-gcc' 'mingw32-w32api')
license=('MIT')
source=($url/ftp/lua-$pkgver.tar.gz)
options=(!strip !makeflags staticlibs)
md5sums=('efbb645e897eae37cad4344ce8b0a614')

build() { 
  cd $srcdir/lua-$pkgver
  make CC=i486-mingw32-gcc \
    AR="i486-mingw32-ar rcu" \
    RANLIB="i486-mingw32-ranlib" \
    STRIP="i486-mingw32-strip" \
    CC="i486-mingw32-gcc" \
    INSTALL_TOP="$pkgdir/usr/i486-mingw32" \
    TO_BIN="lua.exe luac.exe lua52.dll" \
    mingw install
}

# vim: ts=2 sw=2 et ft=sh
