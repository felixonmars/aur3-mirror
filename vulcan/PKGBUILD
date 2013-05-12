# Maintainer: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: rabyte <rabyte*gmail>
pkgname=vulcan
pkgver=0.92
pkgrel=4
pkgdesc="A 3D chess variant that appears in a well-known science fiction TV series"
arch=('i686' 'x86_64')
url="http://www.fzort.org/mpr/projects/vulcan/"
license=('GPL2')
depends=('glu' 'libpng' 'mesa')
changelog=Changelog
options=('!makeflags')
source=("http://distro.ibiblio.org/zenwalk/source/extra/games/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('16842729e971a00caa9135b956c159740c6a3e9fba8f0e2ce163166111c0eb4b')

prepare() {
	cd $srcdir/$pkgname-$pkgver
	sed -i 's|CFLAGS	= -O2 -g|CFLAGS	+=|g' Makefile
	sed -i 's|= -O2 -g|+=|' lib3d/Makefile
}

build() {
	cd $srcdir/$pkgname-$pkgver
	make PREFIX=/usr
}

package() {
	cd $srcdir/$pkgname-$pkgver

	# fix for missing '-D'...
	install -dm755 $pkgdir/usr/bin

	make PREFIX=$pkgdir/usr install

	# documentation
	install -dm755 $pkgdir/usr/share/doc/$pkgname
	install -m644 ChangeLog README TECH TODO $pkgdir/usr/share/doc/$pkgname
}

