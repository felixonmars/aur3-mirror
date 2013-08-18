# Maintainer: mimas <mimasgpc@free.fr>

pkgname=lua-complex
pkgver=20111221
pkgrel=1
url=http://www.tecgraf.puc-rio.br/~lhf/ftp/lua/
source=(http://www.tecgraf.puc-rio.br/~lhf/ftp/lua/5.2/lcomplex.tar.gz patch.diff)
depends=(lua)
pkgdesc="Provide support for complex numbers in Lua 5.2"
arch=('i686' 'x86_64')
license=('Public domain')

prepare() {
  cd complex
  patch -i ../patch.diff
}

build() {
  cd complex
  make so
}

check() {
  cd complex
  make test
}

package() {
  cd complex
  install -m0755 -D complex.so "$pkgdir/usr/lib/lua/5.2/complex.so"
  install -m0644 -D README "$pkgdir/usr/share/doc/lua-complex/README"
}

md5sums=('056fd744e0c5d9502e083cf42e5031c4'
         '14609f85d0124110a8b6ca2fc7dae6f7')
