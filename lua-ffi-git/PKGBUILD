# Maintainer: Josh Klar <j@iv597.com>

pkgname=lua-ffi-git
pkgver=20130202
pkgrel=1
pkgdesc="Standalone FFI library for calling C functions from Lua."
arch=('any')
url=("https://github.com/jmckaskill/luaffi")
license=('MIT')
conflicts=('lua-ffi')
depends=('lua')
optdepends=()
makedepends=('git')
source=('Makefile.patch')
sha1sums=('0c7adb9cb718a14768a3d7aa9013cb47caa15ef5')

_gitroot="git://github.com/jmckaskill/luaffi"
_gitname="luaffi"

build () {
  cd "$srcdir"

  msg "Connecting to GIT server..."

  if [ -d "$srcdir/$_gitname" ]; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"

  cd "$srcdir/$_gitname"
  patch -p1 Makefile $srcdir/Makefile.patch
  make || return 1
}

package () {
  cd "$srcdir/$_gitname"

  install -Dm 755 ffi.so "${pkgdir}/usr/lib/lua/5.2/ffi.so"
}

