# Maintainer: Linus Sjögren <thelinx@unreliablepollution.net>
pkgname=lua-oauth-git
pkgver=20140602
pkgrel=1
pkgdesc="An OAuth client library for Lua."
arch="any"
url="https://github.com/ignacio/LuaOAuth"
license=('MIT')
depends=('lua>=5.2' 'lua-socket' 'lua-sec' 'lua-crypto' 'lua-base64')
makedepends=('git')
conflicts=('lua-oauth')
provides=('lua-oauth')

_gitroot="git://github.com/ignacio/LuaOAuth.git"
_gitname="LuaOAuth"

package() {
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

	install -Dm0664 src/OAuth.lua \
		$pkgdir/usr/share/lua/5.2/OAuth/init.lua

	install -Dm0664 src/OAuth/coreLuaNode.lua \
		$pkgdir/usr/share/lua/5.2/OAuth/coreLuaNode.lua

	install -Dm0664 src/OAuth/coreLuaSocket.lua \
		$pkgdir/usr/share/lua/5.2/OAuth/coreLuaSocket.lua

	install -Dm0664 src/OAuth/helpers.lua \
		$pkgdir/usr/share/lua/5.2/OAuth/helpers.lua

	install -Dm0664 LICENSE \
		$pkgdir/usr/share/licenses/$pkgname/LICENSE
} 
