# Maintainer: masterkorp :  masterkorp [at] gmail [dot] com>

pkgname=luakit-luamail-git
pkgver=20111009
pkgrel=2
pkgdesc="Luakit with a email client"
arch=('i686' 'x86_64')
url="https://github.com/Dieterbe/luakit"
license=('GPL3')
depends=('libwebkit' 'luafilesystem' 'libunique' 'luaimap-git' 'luasec' 'msmtp' 'lua-md5')
makedepends=('git' 'lua' 'help2man')
optdepends=('luajit2:Needed if use the luajit option in make')
source=($pkgname.install)
provides=(luakit)
conflicts=('luakit' 'luakit-git' 'luakit-develop-git')
install=$pkgname.install

_gitroot="git://github.com/Dieterbe/luakit.git"
_gitname="luamail"
_gitbranch=${_gitname}

md5sums=('184069a7264115726f73204d1d708e2c')

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone --depth=1 $_gitroot $_gitname --branch $_gitbranch
    cd $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  makeopts="PREFIX=/usr DESTDIR="${pkgdir}" DEVELOPMENT_PATHS=0 "
  make ${makeopts} all
  make ${makeopts} install

}

# vim:set ts=2 sw=2 et:

