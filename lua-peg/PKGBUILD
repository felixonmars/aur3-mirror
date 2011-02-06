# Maintainer: Linus Sjögren <thelinx@unreliablepollution.net>
pkgname=lua-peg
pkgver=0.10.1
pkgrel=1
pkgdesc="LPeg is a pattern-matching library for Lua."
license=('MIT')
arch="any"
url="http://www.inf.puc-rio.br/~roberto/lpeg/lpeg.html"
depends=('lua')
replaces=('lpeg')
conflicts=('lpeg')
provides=('lpeg')
source=('http://www.inf.puc-rio.br/~roberto/lpeg/lpeg-0.10.1.tar.gz'
        'LICENSE')
md5sums=('4d28947d89191a02effb611df8ba7c3c'
         'd442138f35eea420362ff01fb712e411')

build() {
  cd "$srcdir/lpeg-$pkgver"
	if [ $CARCH = x86_64 ]; then
		COPT=-fPIC
	fi
	make LUADIR=/usr/include/ COPT=$COPT || return -1
	install -Dm0775 lpeg.so \
		$pkgdir/usr/lib/lua/5.1/lpeg.so
	install -Dm0664 $srcdir/LICENSE \
		$pkgdir/usr/share/licenses/$pkgname/LICENSE
}
