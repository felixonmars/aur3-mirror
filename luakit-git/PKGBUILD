# Contributor: J. W. Birdsong <jwbirdsong AT gmail DOT com>
# Maintainer: moebiuseye <möëbïüs döt ëÿë ät gmäïl döt cöm>

pkgname=luakit-git
pkgver=1799.993d814
pkgrel=1
pkgdesc="A fast, small, webkit-gtk based browser extensible by Lua"
arch=('i686' 'x86_64')
url="http://mason-larobina.github.com/luakit/"
license=('GPL3')
depends=('libwebkit' 'lua51-filesystem' 'libunique')
makedepends=('git' 'lua51')
optdepends=('luajit2: Needed if use the luajit option in make')
source=($pkgname.install "git://github.com/mason-larobina/luakit.git")
provides=(luakit)
conflicts=('luakit' 'luakit-develop-git')
install=$pkgname.install

_gitroot="luakit"
_gitname="develop"

md5sums=('7ae1798bdc8f7d81adf9b2194b4e9483' "SKIP")

export makeopts

pkgver () {
    cd "$srcdir/$_gitroot"
    printf '%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd "${srcdir}/$_gitroot"

  makeopts="PREFIX=/usr DESTDIR="${pkgdir}" DEVELOPMENT_PATHS=0 "
  # if you want to use luajit2, comment the above line and uncomment the following
  # makeopts="PREFIX=/usr DESTDIR="${pkgdir}" DEVELOPMENT_PATHS=0 USE_LUAJIT=1" 
  
  LUA_PKG_NAME=lua5.1 make ${makeopts} all
}

package() {
  cd "${srcdir}/$_gitroot"
  make ${makeopts} install
}
