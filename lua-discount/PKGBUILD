# Maintainer: Andrew Antle <andrew dot antle at gmail dot com>
# Contributor: Anders Bergh <anders1@gmail.com>

pkgname=lua-discount
pkgver=1.2.10.1
pkgrel=1
pkgdesc="A Lua binding to Discount"
arch=('i686' 'x86_64')
url="http://asbradbury.org/projects/lua-discount/"
license=('BSD')
depends=('lua' 'discount')
# LuaForge URLs have to be updated manually, due to the ID
source=(http://luaforge.net/frs/download.php/3758/$pkgname-$pkgver.tar.gz)
md5sums=('7dc7055816dc755aacb48bfd5eb2eb5b')

build() {
  cd $srcdir/$pkgname-$pkgver

  make || return 1
  install -Dm755 discount.so $pkgdir/usr/lib/lua/5.1/discount.so || return 1
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE || return 1
}
