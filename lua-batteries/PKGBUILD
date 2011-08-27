# Maintainer: Pierre Chapuis <catwell at archlinux dot us>

pkgname=lua-batteries
pkgver=20091221
pkgrel=1
pkgdesc='Lua general use functions module'
arch=('any')
url="ftp://catwell.info/code/$pkgname"
license=('MIT')
depends=('lua')
optdepends=('luasocket')
source=("$url/$pkgname-$pkgver.tar.gz")
md5sums=('37a8b07f66d9972b2c50ec19cb09e15a')

build() {
  cd $srcdir/$pkgname
  install -Dm0755 batteries.lua $pkgdir/usr/share/lua/5.1/batteries.lua
  install -Dm0644 COPYING.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
