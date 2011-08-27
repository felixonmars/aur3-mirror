# Maintainer: Linus Sjögren <thelinx@unreliablepollution.net>
pkgname=lua-state-git
pkgver=20101107
pkgrel=2
pkgdesc="A library for simple and painless storing of tables in Lua."
arch="any"
url="https://github.com/TheLinx/lstate"
license=('custom:Public Domain')
depends=('lua>=5.1' 'luafilesystem')
makedepends=('git')
conflicts=('lua-state')

_gitroot="git://github.com/TheLinx/lstate.git"
_gitname="lstate"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Installing..."

  #
  # BUILD HERE
  #

  cd "$srcdir/$_gitname"
	install -Dm0664 state/init.lua \
		$pkgdir/usr/share/lua/5.1/state/init.lua
	install -Dm0664 LICENSE \
		$pkgdir/usr/share/licenses/$pkgname/LICENSE
} 
