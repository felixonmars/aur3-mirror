# Maintainer: mimas <mimasgpc@free.fr>

pkgname=lua-mathx
pkgver=20120419
pkgrel=1
url=http://www.tecgraf.puc-rio.br/~lhf/ftp/lua/
source=(http://www.tecgraf.puc-rio.br/~lhf/ftp/lua/5.2/lmathx.tar.gz patch.diff)
depends=(lua)
pkgdesc="Extend the Lua math library with functions available in C99"
arch=('i686' 'x86_64')
license=('Public domain')

prepare() {
  cd mathx
  patch -i ../patch.diff
}

build() {
  cd mathx
  make so
}

check() {
  cd mathx
  make test
}

package() {
  cd mathx
  install -m0755 -D mathx.so "$pkgdir/usr/lib/lua/5.2/mathx.so"
  install -m0644 -D README "$pkgdir/usr/share/doc/lua-mathx/README"
}

md5sums=('1a5db9aa0d0c90fb758c57c6deb3cf1b'
         '651f4785a9cafc7d9eba1fbaba989ab1')
