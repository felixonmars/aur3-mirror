# Maintainer: Josh Klar <j@iv597.com>

pkgname=lua51-ffi-git
pkgver=20130202
pkgrel=1
pkgdesc="Standalone FFI library for calling C functions from Lua."
arch=('any')
url=("https://github.com/jmckaskill/luaffi")
license=('MIT')
conflicts=('lua-ffi')
depends=('lua51')
optdepends=()
makedepends=('git')

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
  make || return 1
}

package () {
  cd "$srcdir/$_gitname"

  install -Dm 755 ffi.so "${pkgdir}/usr/lib/lua/5.1/ffi.so"
}

