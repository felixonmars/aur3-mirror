# Maintainer: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: rabyte <rabyte.at.pen.dot.tj>
# Contributor: mpie <michael.kyne-phillips1.at.ntlworld.dot.com>
pkgname=openmortal
pkgver=0.7
pkgrel=4
pkgdesc="A networked clone of the fighting game Mortal Kombat"
arch=('i686' 'x86_64')
url="http://openmortal.sourceforge.net/"
license=('GPL2')
depends=('freetype2' 'perl' 'sdl_image' 'sdl_mixer' 'sdl_net')
changelog=Changelog
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
        "${pkgname}-${pkgver}-gcc41.patch")
sha256sums=('9c302560d71ddcd3473ba2a1022fd118cbce87a4cd4b3080cb46288a410bb710'
            'e56c46d412dc11e04430da120d264d9d3ad90e207f941a7791712d972bfecdfd')

prepare() {
	cd $srcdir/$pkgname-$pkgver
	patch -Np0 -i $srcdir/$pkgname-$pkgver-gcc41.patch
}

build() {
	cd $srcdir/$pkgname-$pkgver
	./configure --prefix=/usr
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install

	# documentation
	install -dm755 $pkgdir/usr/share/doc/$pkgname
	install -m644 \
		AUTHORS \
		ChangeLog \
		README \
		TODO \
		$pkgdir/usr/share/doc/$pkgname
}

