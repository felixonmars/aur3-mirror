# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=luabind-compat
pkgver=0.8.1
pkgrel=1
pkgdesc="A library that helps you create bindings between C++ and Lua"
arch=('i686' 'x86_64')
url="http://www.rasterbar.com/products/luabind.html"
license=('MIT')
depends=('lua>=5.1' 'gcc-libs')
makedepends=('boost-build')
provides=('luabind')
conflicts=('luabind')
source=(http://downloads.sourceforge.net/luabind/luabind-$pkgver.zip)
md5sums=('e47f0b493a76829dbfc33d151a03ae16')

build() {
  cd luabind-$pkgver

  bjam || return 1

  mkdir -p $pkgdir/usr/include
  cp -rf luabind/ $pkgdir/usr/include/
  install -Dm644 bin/*/debug/libluabind.so $pkgdir/usr/lib/libluabind.so
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

  find $pkgdir/usr/include -type f -exec chmod 644 {} \;
}
