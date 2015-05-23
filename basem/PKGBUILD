# Maintainer: Florian Mayer <mayerflorian@me.com>
pkgname=basem
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="Brings Sys-V Semaphore to the command line"
arch=('any')
url="http://www.github.com/forflo/basem"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/forflo/forflo.github.io/raw/master/tarballs/basem-1.0.tar.gz")
noextract=()
md5sums=('54abe422e36e3d134c90e59dcbe8e605')

build() {
	cd ${srcdir}/$pkgname-$pkgver
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
