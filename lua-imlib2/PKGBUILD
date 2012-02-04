# Maintainer: Linus Sjögren <thelinx@unreliablepollution.net>
pkgname=lua-imlib2
pkgver=0.1
pkgrel=1
pkgdesc="A complete binding to the Imlib2 image manipulation library."
license=('MIT')
arch="any"
url="https://github.com/asb/lua-imlib2"
depends=('lua>=5.1' 'imlib2')
source=($url/tarball/$pkgver)
md5sums=('66a629a4241d763f14283ae35e9f78fa')

build() {
  cd "$srcdir"
  cd `find -name asb*`
	if [ $CARCH = x86_64 ]; then
		CFLAGS=-fPIC
	fi
	make CFLAGS=$CFLAGS
  install -Dm0775 limlib2.so \
    $pkgdir/usr/lib/lua/5.1/limlib2.so
	install -Dm0664 imlib2.lua \
		$pkgdir/usr/share/lua/5.1/imlib2.lua
  install -Dm0644 LICENSE \
    $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
