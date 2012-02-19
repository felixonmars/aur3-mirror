# Contributor: Anders Bergh <anders1@gmail.com>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Maintainer: Linus Sjögren <thelinx@unreliablepollution.net>
pkgname=luajit2
_pkgver=2.0.0_beta9
_pkghotfix=hotfix1
pkgver=${_pkgver}_${_pkghotfix}
pkgrel=1
pkgdesc="A Just-In-Time Compiler for Lua"
arch=(i686 x86_64)
url="http://luajit.org"
license=('MIT')
source=(http://luajit.org/download/LuaJIT-${_pkgver/_/-}.tar.gz
        http://luajit.org/download/beta9_hotfix1.patch
        lua_root.patch)

md5sums=('e7e03e67e2550817358bc28b44270c6d'
         '4920f04fcef1ce486891509faf26b4f1'
         'c8da9c6790e20a12a0e2496f438d9dc3')

build() {
  cd "$srcdir"/LuaJIT-${_pkgver/_/-}
  patch -p0 < ../lua_root.patch
  patch -p1 < ../beta9_hotfix1.patch

  make
  make install DESTDIR="$pkgdir" PREFIX=/usr
  ln -sf luajit-${_pkgver/_/-} "$pkgdir"/usr/bin/luajit2

  install -Dm644 "$srcdir/LuaJIT-${_pkgver/_/-}/COPYRIGHT" "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
}
