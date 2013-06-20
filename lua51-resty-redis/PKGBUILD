# Maintainer: Gianni Vialetto <gianni@rootcube.net>

pkgname=lua51-resty-redis
pkgver=0.15
pkgrel=1
pkgdesc='Lua resty redis library'
arch=('i686' 'x86_64')
url="https://github.com/agentzh/lua-resty-redis"
license=('BSD')
depends=('lua51')
source=(resty-redis-$pkgver.tar.gz::https://github.com/agentzh/lua-resty-redis/archive/v$pkgver.tar.gz)
md5sums=('88beb9f9f687a58b762641072ead340a')
changelog=CHANGELOG

package() {
  cd $srcdir/lua-resty-redis-$pkgver
  make PREFIX=$pkgdir DESTDIR=$pkgdir \
    LUA_LIB_DIR=usr/share/lua/5.1 \
    install
}
