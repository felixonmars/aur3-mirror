# maintained by slact <feedparser@slact.net>
# previusly maintained by chisiyuan <14cheese at gmail dot com>

pkgname=lua-feedparser
pkgver=0.71
pkgrel=1
pkgdesc="Rss and Atom feed parser, using expat via the luaExpat binding."
arch=('any') 
url="http://http://github.com/slact/lua-feedparser/"
license=('BSD')
depends=('lua' 'lua-expat')

source=( "git+git://github.com/slact/lua-feedparser.git#tag=${pkgver}")
sha1sums=( 'SKIP' )

_lua_ver=5.2
_lua_dir=/usr/share/lua/${_lua_ver}

build() {
  cd $srcdir/lua-feedparser
  make test
}

package() {
    cd $srcdir/lua-feedparser
    mkdir -p "${pkgdir}/${_lua_dir}"
    make install -e LUA_DIR="${pkgdir}/${_lua_dir}"
}
