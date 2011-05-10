# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=luaosc
pkgver=1.0.0
pkgrel=1
pkgdesc="A Wrapper module completely written in Lua that implements the functionality of the OpenSoundControl protocol."
arch=(any)
url="http://luaforge.net/projects/luaosc/"
license=('GPL')
depends=('lpack' 'luasocket')
source=("http://luaforge.net/frs/download.php/3916/$pkgname-$pkgver.tar.gz")
md5sums=('47e38d392fee3e374946b6096d998665')

build() {
  return 0
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # library
  install -d "$pkgdir/usr/share/lua/5.1/osc"
  install -Dm644 src/osc.lua "$pkgdir/usr/share/lua/5.1"
  install -Dm644 src/osc/*.lua "$pkgdir/usr/share/lua/5.1/osc"

  # samples

  install -d "$pkgdir/usr/share/$pkgname/samples"
  install -Dm644 samples/* "$pkgdir/usr/share/$pkgname/samples"
}

# vim:set ts=2 sw=2 et:
