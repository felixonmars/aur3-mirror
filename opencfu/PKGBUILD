# Maintainer: Quentin Geissmann <opencfu@gmail.com>
pkgname=opencfu
pkgver=3.9.0
pkgrel=1
pkgdesc="A C++ program to count cell colonies (CFUs) on agar plates by processing digital pictures."
arch=(any)
url="http://opencfu.sourceforge.net/"
license=('GPLv3')
depends=('gtkmm>=2.24' 'opencv>=2.4.3' )
makedepends=('autoconf' 'automake' 'sed' 'grep' 'make' 'gcc>=4.7')
source=("http://sourceforge.net/projects/opencfu/files/linux/${pkgname}-${pkgver}.tar.gz")
md5sums=(db4af5a4ab8718baf3c5b5000ca56453)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}
package(){
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

