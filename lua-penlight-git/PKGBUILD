# Maintainer: Linus Sjögren <thelinx@unreliablepollution.net>
pkgname=lua-penlight-git
pkgver=1.1.0
pkgrel=3
pkgdesc="A set of pure Lua libraries focusing on input data handling, functional programming, and OS path management."
arch="any"
url="https://github.com/stevedonovan/Penlight"
license=('MIT')
provides=('lua-penlight')
conflicts=('lua-penlight')
depends=('lua' 'lua-filesystem')
makedepends=('git')

_gitroot="$url.git"
_gitname="Penlight"

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
	mkdir -p $pkgdir/usr/share/lua/5.1/pl
	install -Dm0664 lua/pl/* \
		$pkgdir/usr/share/lua/5.1/pl/
	install -Dm0664 LICENSE.md \
		$pkgdir/usr/share/licenses/$pkgname/LICENCE.md
} 
