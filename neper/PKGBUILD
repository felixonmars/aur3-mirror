# Maintainer: Shaun Mucalo <shaun.mucalo@pg.canterbury.ac.nz>
# Contributor: 
pkgname=neper
pkgver=2.0.0
pkgrel=1
pkgdesc="Polycrystal generation, meshing and visualisation."
arch=('any')
url="http://neper.sourceforge.net"
license=('GPL3')
depends=('gsl' 'povray' 'scotch' 'libmatheval' 'gmsh')
makedepends=('cmake')
install=
changelog=
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tgz)
sha256sums=('c1b6cad2238e31ad93963fe233879be472aef5319749cc5b2cd9912a6a75fddd')
 #generate with 'makepkg -g'

build() {
	cd "$srcdir/$pkgname-$pkgver/src"
	mkdir build && cd build
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
	make
}


package() {
	cd "$srcdir/$pkgname-$pkgver/src/build"
	make DESTDIR="$pkgdir/" install
}
