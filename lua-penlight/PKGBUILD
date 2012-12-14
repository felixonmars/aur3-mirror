# Maintainer: Linus Sjögren <thelinx@unreliablepollution.net>
pkgname=lua-penlight
pkgver=0.9.0
pkgrel=1
pkgdesc="A set of pure Lua libraries focusing on input data handling, functional programming, and OS path management."
license=('MIT')
arch="any"
url="https://github.com/stevedonovan/Penlight"
depends=('lua' 'lua-filesystem')
source=($url/tarball/$pkgver)
md5sums=('6671e096c8455baffbb98e7c21bb83ee')

build() {
  cd "$srcdir"
  cd `find -name stevedonovan*`
	mkdir -p $pkgdir/usr/share/lua/5.1/pl/
	install -Dm0664 lua/pl/* \
		$pkgdir/usr/share/lua/5.1/pl/
  install -Dm0644 LICENCE.txt \
    $pkgdir/usr/share/licenses/$pkgname/LICENCE.txt
}
