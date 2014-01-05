pkgname=opencc-gui
pkgver=git
pkgrel=1
pkgdesc="Gui in Qt of Library for Open Chinese Convert"
arch=(i686 x86_64)
url="http://code.google.com/p/opencc/"
license=('Apache License 2.0')
depends=('opencc')
source=()

build() {
	if [ ! -e 'opencc-gui' ]; then
		git clone https://github.com/BYVoid/opencc-gui
	fi
	cd $srcdir/${pkgname}
	sed -i 's/qmake /qmake-qt4 /;' build.sh
	./build.sh
}

package() {
	cd $srcdir/${pkgname}
	mkdir -p ${pkgdir}/usr/bin
	cp build/$pkgname ${pkgdir}/usr/bin
}
