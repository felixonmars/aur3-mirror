# Maintainer: rtfreedman  (rob<d0t>til<d0t>freedman<aT>googlemail<d0t>com

pkgname=radium_compressor
pkgver=0.5.1
pkgrel=4
pkgdesc="A standalone jack audio compressor"
arch=(i686 x86_64)
url="http://users.notam02.no/~kjetism/radium/compressor_plugin.php"
license=('GPL2')
install="radium_compressor.install"
depends=(jack qt4)
makedepends=(faust)
source=("http://archive.notam02.no/arkiv/src/$pkgname-$pkgver.tar.gz"
		"radium_compressor.desktop"
		"radium_compressor.install"
		"radium_compressor.png"
		"Makefile.patch")

md5sums=('d6e24bb1ef4f279adda07ff6e10f3601'
         '19b176fb5434ebd1ef2e4fcd21081e6b'
         'e4b5094cc87634778b5017ba9258f3fd'
         'c535752663bd92f3467e9aef7a5316fe'
         '48e3e1ee69f0234db1a4bad7af973283')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p0 -i ../Makefile.patch
  make
# make CXXFLAGS="-march=native"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  
  install -Dm644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 ../$pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
}

# vim:set ts=2 sw=2 et:
