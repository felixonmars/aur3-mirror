# Maintainer: SpepS <dreamspepser at yahoo dot it>

_pkg=pack
pkgname=l$_pkg
pkgver=20070629
pkgrel=1
pkgdesc="A LUA library for packing and unpacking binary data."
arch=(i686 x86_64)
url="http://www.tecgraf.puc-rio.br/~lhf/ftp/lua/#lpack"
license=('GPL')
depends=('lua')
source=("http://www.tecgraf.puc-rio.br/~lhf/ftp/lua/5.1/$pkgname.tar.gz")
md5sums=('e6fe2f72fd6447b8e1712bbb95b32493')

build() {
  cd "$srcdir/$_pkg"

  make CFLAGS="-fPIC" so
}

package() {
  cd "$srcdir/$_pkg"

  # library
  install -Dm755 $_pkg.so "$pkgdir/usr/lib/lua/5.1/$_pkg.so"

  # sample
  install -Dm644 test.lua "$pkgdir/usr/share/$pkgname/test.lua"
}

# vim:set ts=2 sw=2 et:
