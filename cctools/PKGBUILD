pkgname=cctools
pkgver=2.0
pkgrel=1
pkgdesc="An editor for Chip's Challenge levels."
url="http://cctools.zrax.net/"
arch=("i686" "x86_64")
depends=(qt4)
optdepends=("tworld: for playtesting")
makedepends=(cmake)
license=(GPL3)
install=cctools.install
source=("http://cctools.zrax.net/cctools-$pkgver.tar.gz"
        "ccedit.desktop"
        "ccplay.desktop"
		"cctools-$pkgver.patch"
		)
md5sums=('e6174ff509437b39ec4ea844e2ee5419'
         'c49153983e8c9e1f7bc702a4264e65db'
         '2060c86d0de0da5c5847601101f9d66b'
		 'bf085deb236eda07fc8ea67d2737df10')
sha1sums=('5b6ddbdd6159a71cf1c2d12d2e212ba62457267f'
          'fbc9c47f99f303cf316f97cb81cfd6ba35567364'
          'd8b5262e7839ed5ac2ed372831677a2607eb5677'
		  'f689a97871125bbcaaf16a719ba25ec02b0d1ab9')

prepare () {
	cd $srcdir/$pkgname-$pkgver
	
	patch -Np1 -i ../cctools-$pkgver.patch
}

build () {
	cd $srcdir/$pkgname-$pkgver

	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
	make || return 1
}

package () {
	cd $srcdir/$pkgname-$pkgver

	make DESTDIR=$pkgdir install

	mkdir -p "$pkgdir"/usr/share/{pixmaps,applications}

	install -m644 "$srcdir"/{ccedit,ccplay}.desktop "$pkgdir/usr/share/applications/"

	install -m644 src/CCEdit/icons/boot-48.png "$pkgdir/usr/share/pixmaps/ccedit-icon.png"
	install -m644 src/CCPlay/icons/chip-48.png "$pkgdir/usr/share/pixmaps/ccplay-icon.png"
}
