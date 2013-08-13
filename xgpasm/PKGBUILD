# Maintainer: Johannes Martin <dorhonzor@gmail.com>
pkgname=xgpasm
pkgver=1.0
pkgrel=3
epoch=
pkgdesc="gpasm GUI"
arch=('i686' 'x86_64')
url="http://xizard.free.fr/logiciels/xgpasm/xgpasm.html"
license=('unknown')
groups=()
depends=(gputils gtk)
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
source=("http://xizard.free.fr/download/source/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('eba9ab26be709ec5ae8b907994728a80')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
