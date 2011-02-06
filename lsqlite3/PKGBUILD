# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=lsqlite3
pkgver=0.7
pkgrel=1
pkgdesc="A binding for Lua to the SQLite3 database library"
arch=(i686 x86_64)
url="http://luaforge.net/projects/luasqlite/"
license=('GPL')
depends=('lua' 'sqlite3')
source=("http://luaforge.net/frs/download.php/4472/$pkgname-7.tar.gz")
md5sums=('ef7afdd3ea7a29333daa951cda3175bb')

build() {
  cd "$srcdir/$pkgname-7"

  make
}

package() {
  cd "$srcdir/$pkgname-7"

  mkdir -p "$pkgdir"/usr/{lib/lua/5.1,share/{$pkgname/examples,doc/$pkgname}}
  install -Dm 755 $pkgname.so "$pkgdir/usr/lib/lua/5.1"
  install -Dm 644 examples/* "$pkgdir/usr/share/$pkgname/examples"
  install -Dm 644 doc/$pkgname.html "$pkgdir/usr/share/doc/$pkgname"
}

# vim:set ts=2 sw=2 et:
