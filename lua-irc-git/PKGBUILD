# Maintainer: Linus Sjögren <thelinx@unreliablepollution.net>
pkgname=lua-irc-git
pkgver=20101121
pkgrel=2
pkgdesc="IRC library for Lua"
arch="any"
url="https://github.com/JakobOvrum/LuaIRC"
license=('MIT')
provides=('lua-irc')
depends=('lua' 'luasocket')
makedepends=('git')

_gitroot="$url.git"
_gitname="LuaIRC"

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
	mkdir -p $pkgdir/usr/share/lua/5.1/irc/
	install -Dm0664 *.lua \
		$pkgdir/usr/share/lua/5.1/irc/
	install -Dm0664 LICENSE.txt \
		$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
} 
