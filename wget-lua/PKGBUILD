# Maintainer: Alastair Stuart <alastair@muto.so>

pkgname=wget-lua
pkgver=1.14
fullpkgver=1.14.lua.20130523-9a5c
pkgrel=1
pkgdesc="Wget with Lua scripting"
url="http://archiveteam.org/index.php?title=Wget_with_Lua_hooks"
license=('GPL')
depends=('openssl' 'libidn' 'pcre' 'util-linux' 'lua')
optdepends=("ca-certificates: HTTPS Downloads")
makedepends=('git' 'perl')
provides=('wget-lua')
arch=('i686' 'x86_64')
source=("http://warriorhq.archiveteam.org/downloads/wget-lua/wget-1.14.lua.LATEST.tar.bz2"
        "lua.patch"
        "fix-texi2pod.patch")
sha1sums=('aa5fb38caea511f7adce01ff6d341722e2749276'
          '4d2bd76e0f4a4d55e98a3d0f65ac48e5cb6145fc'
          'cefec7e54a4f1524506c7e549841bda7aa422837')

build() {
  patch -p0 -i $srcdir/lua.patch
  patch -p0 -i $srcdir/fix-texi2pod.patch
  cd "$srcdir/wget-$fullpkgver"

  ./configure --with-ssl=openssl --disable-nls
  make
}

package() {
  cd "$srcdir/wget-$fullpkgver/src"
  mkdir -p "$pkgdir/usr/bin/"
  cp wget "$pkgdir/usr/bin/wget-lua"
}

