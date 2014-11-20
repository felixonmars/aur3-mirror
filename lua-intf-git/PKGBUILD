# Maintainer: Steve K. Chiu <unknown>
# Contributor: Mateusz Paluszkiewicz <aifam96@gmail.com>

pkgname=lua-intf-git
pkgver=20141119
pkgrel=1
pkgdesc="A binding between C++11 and Lua language"
arch=(any)
url="https://github.com/SteveKChiu/lua-intf"
license=('MIT')
depends=('lua')
makedepends=('git')
source=("${pkgname}::git://github.com/SteveKChiu/lua-intf.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git log -1 --pretty=format:%cd --date=short | sed 's/-//g'
}

package() {
  cd "$pkgname"
  mkdir -p "$pkgdir/usr/include/lua-intf"
  cp -r ./LuaIntf/* "$pkgdir/usr/include/lua-intf"
}
