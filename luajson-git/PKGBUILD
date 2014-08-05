# Contributor: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
# Contributor: Pierre Chapuis <catwell at archlinux dot us>
_pkgname=luajson
pkgname=$_pkgname-git
pkgver=1.3.3.r1.gb2fcf6f
pkgrel=1
pkgdesc="JSON parser/encoder for Lua"
arch=('any')
url="http://www.eharning.us/wiki/luajson"
license=('MIT')
depends=('lua-socket' 'lua-lpeg')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/harningt/luajson.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$_pkgname"
  install -dm755 "$pkgdir/usr/share/lua/5.1/"
  cp -a lua/* "$pkgdir/usr/share/lua/5.1/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
