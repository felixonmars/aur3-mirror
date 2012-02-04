# Maintainer: Linus Sjögren <thelinx@unreliablepollution.net>
pkgname=synk
pkgver=0.1.1
_vername=rush
pkgrel=1
pkgdesc="A cross platform threading library"
arch="any"
url="https://github.com/mnmlstc/synk"
license=('BSD')
makedepends=('git' 'cmake>=2.8')
source=("$url/tarball/$_vername-$pkgver")
md5sums=('f603a147630dfe7ff192d0111d66bd5f')

build() {
  cd "$srcdir"
	cd `find -name mnmlstc*`
	mkdir build; cd build
	cmake -DCMAKE_INSTALL_PREFIX=$pkgdir/usr ..
	make install
	install -Dm0664 ../License.md \
		$pkgdir/usr/share/licenses/$pkgname/License.md
}
