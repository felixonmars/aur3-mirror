# Maintainer: Corey Richardson <corey@octayn.net>
pkgname=xavante
pkgver=2.2.1
pkgrel=2
pkgdesc="A Lua HTTP 1.1 Web server with a modular architecture"
arch=('any')
url="http://keplerproject.github.com/xavante/"
license=('MIT')

depends=(lua copas luasocket luafilesystem)

source=(https://github.com/downloads/keplerproject/xavante/$pkgname-$pkgver.tar.gz
        license.html::http://keplerproject.github.com/xavante/license.html)
md5sums=('fbbb0655095bcd6b8345095f39470a1a'
         '25537b0c84340f2503f537cfb5165956')

package() {
  cd "$srcdir"/$pkgname-$pkgver

  make PREFIX="$pkgdir/usr" install

  cd "$srcdir"
  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname/
  cp license.html "$pkgdir"/usr/share/licenses/$pkgname/
}
