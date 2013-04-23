#Maintainer: Alex Brinister (alex_brinister@yahoo.com)
pkgname=frcmake
pkgver=20130419
pkgrel=4
pkgdesc="Some CMake stuff for use with the VxWorks 6.3 GCC Toolchain"
arch=(any)
provides=('frcmake')
url="http://firstforge.wpi.edu/sf/projects/c--11_toochain"
license=('GPL')
depends=('wput' 'cmake')
options=('!strip' 'libtool' '!zipman')
conflicts=('vxworks-gcc-toolchain-bin')
source=("git+http://bitbucket.org/frc-cpp11/$pkgname")
sha512sums=('SKIP')

pkgver() {
	date +%Y%m%d
}

build() {
  cd "$srcdir/$pkgname"
	mkdir build && cd build
	cmake ..
	make -j$(nproc) || return 1
}

package() {
	cd "$srcdir/$pkgname/build"
	make -j$(nproc) DESTDIR=$pkgdir	install || return 1
}

