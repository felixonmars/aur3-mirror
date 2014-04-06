# Maintainer: Matthias Blaicher <matthias@blaicher.com>
pkgname=wgms3d
pkgver=1.2.2
pkgrel=1
pkgdesc="Free dielectric electromagnetic waveguides mode solver"
arch=('i686' 'x86_64')
url="http://www.soundtracker.org/raw/wgms3d/index.html"
license=('GPL')
depends=("arpack" "blas" "superlu")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("http://www.soundtracker.org/raw/wgms3d/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('04e1795d8731d5e4f35dec7cb0ec654f')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	sed -i 's/libsuperlu.so.4.0.0/libsuperlu.so/g' configure
	sed -i 's/SUPERLU_INCLUDES=\"-I${withval}\/include\"/SUPERLU_INCLUDES=\"-I${withval}\/include\/superlu\"/g' configure
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr --with-superlu=/usr --with-arpack=/
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
