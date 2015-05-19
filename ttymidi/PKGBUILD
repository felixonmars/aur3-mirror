# Author: Thiago Teixeira <me@thiagot.com>
# Maintainer: Curaro Arsenico <curaro.arsenico@gmail.com>
pkgname=ttymidi
pkgver=0.60
pkgrel=1
epoch=
pkgdesc="A Bridge from Serial to MIDI"
arch=("any")
url="http://www.varal.org/ttymidi"
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
source=("http://www.varal.org/ttymidi/ttymidi.tar.gz")
noextract=()
md5sums=('65f4e1d649ef9b698e1603860d630ef8')
validpgpkeys=()

prepare(){
	sed s/-lasound/-lasound\ -lpthread/g ttymidi/Makefile > Makefile0
	#diff ttymidi/Makefile Makefile0 > Makefile.patch || true
	sed s/"\/usr\/local\/bin"/"\${DESTDIR}&"/g Makefile0 > Makefile
	diff ttymidi/Makefile Makefile > Makefile.patch || true
	patch ttymidi/Makefile < Makefile.patch
	#rm Makefile
	rm Makefile.patch
}

build() {
	cd "ttymidi"

	make
}

package() {
	cd "ttymidi"
	mkdir -p $pkgdir/usr/local/bin
	make DESTDIR="$pkgdir/" install
	echo "ciao"
}
