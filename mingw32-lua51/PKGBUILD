# Maintener: Kévin Guilloy <kevin@guilloy.ath.cx>
# Adapted from mingw32-lua package by Mikael Eriksson <mikael_miffe_eriksson@yahoo.se>

pkgname=mingw32-lua51 
pkgver=5.1.5
pkgrel=2
pkgdesc="A powerful light-weight programming language designed for extending applications. (mingw32)" 
arch=('any')
url="http://www.lua.org/" 
depends=()
conflicts=('mingw32-lua')
depends=('mingw32-runtime')
makedepends=('mingw32-gcc' 'mingw32-w32api')
license=('MIT')
source=($url/ftp/lua-$pkgver.tar.gz)
options=(!strip !makeflags)
md5sums=('2e115fe26e435e33b0d5c022e4490567')

build() { 
  cd $srcdir/lua-$pkgver
  make CC=i486-mingw32-gcc \
    AR="i486-mingw32-ar rcu" \
    RANLIB="i486-mingw32-ranlib" \
    STRIP="i486-mingw32-strip" \
    CC="i486-mingw32-gcc" \
    INSTALL_TOP="$pkgdir/usr/i486-mingw32" \
    TO_BIN="lua.exe luac.exe lua51.dll" \
    mingw install
}


