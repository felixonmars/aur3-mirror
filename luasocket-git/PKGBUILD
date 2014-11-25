# Maintainer: Alfredo Palhares <masterkorp@masterkorp.net>
# Contributor: Shizeeg Unadequatov <shizeeque@gmail.com>

# Please submit your patches to:
# https://github.com/masterkorp/pkgbuilds

pkgname=luasocket-git
_gitname=luasocket
pkgver=537.5edf093
pkgrel=1
pkgdesc="Luasocket is the most comprehensive networking support library for the Lua language, with IPv6 support. This version compatible with Lua 5.1 and 5.2"
arch=('i686' 'x86_64')
url="https://github.com/diegonehab/luasocket"
license=('MIT')
depends=('lua' 'glibc')
makedepends=('git')
conflicts=('luasocket' 'luasocket-hg')
provides=('lua-socket=2.1' 'lua51-socket=2.1')

source=('luasocket::git://github.com/diegonehab/luasocket.git'
        'lua-license.html::http://www.lua.org/copyright.html')
md5sums=('SKIP'
         'd1e76a149b6524aab50d442321075cc5')


pkgver() {
  cd "$_gitname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$_gitname"
  make PLAT=linux prefix=/usr
}

package() {
  cd "$_gitname"
  make DESTDIR="$pkgdir" prefix=/usr install-both
  install -D -m0644 "$srcdir/lua-license.html" "$pkgdir/usr/share/licenses/$pkgname/lua-license.html"

  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
# vim: set ts=2 sw=2 et:
