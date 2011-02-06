# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=(alien)
pkgver=0.5.0
pkgrel=1
pkgdesc="Lets a Lua application call load dynamic libraries and call C functions in a portable way, using libffi."
arch=('i686' 'x86_64')
url="http://alien.luaforge.net/"
license=('GPL')
depends=('lua' 'libffi')
source=("$url$pkgname-$pkgver.tar.gz" "Makefile.$pkgname")
md5sums=('d6b265798f6d610d4651d054f601d468'
         'dc7d4074bd4ea6935afa59c374fa2e05')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Placing Makefile
  cp ../Makefile.$pkgname .

  # Removing luarock
  sed -i "/luarocks/d" samples/*.lua

  # Fixing constants script
  sed -i "s/lua \(constants\).lua/$pkgname-\1/" src/constants

  # Build
  make -f Makefile.$pkgname
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Install
  make -f Makefile.$pkgname DESTDIR="$pkgdir/" install
}