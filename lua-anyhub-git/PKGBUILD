# Maintainer: Linus Sjögren <thelinx@unreliablepollution.net>
pkgname=lua-anyhub-git
pkgver=20101114
pkgrel=2
pkgdesc="A Lua wrapper for the Anyhub API."
arch="any"
url="https://github.com/TheLinx/lanyhub"
license=('custom:CC0')
depends=('lua>=5.1' 'lua-curl')
makedepends=('git')
conflicts=('lua-anyhub')

_gitroot="git://github.com/TheLinx/lanyhub.git"
_gitname="lanyhub"

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
	install -Dm0664 anyhub/init.lua \
		$pkgdir/usr/share/lua/5.1/anyhub/init.lua
	install -Dm0664 LICENSE \
		$pkgdir/usr/share/licenses/$pkgname/LICENSE
} 
