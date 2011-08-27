# Contributer: Matthew Bauer <mjbauer95@gmail.com>
_pkgname=xwii
pkgname=xwii-hypocorism
pkgver=2.8
pkgrel=1
pkgdesc="XWii lets you control your Linux desktop with the Nintendo Wii Remote. (Hypocorism mod)"
arch=(i686 x86_64)
url="http://www.resplect.com/xwii"
license=('custom')
depends=('python' 'wiiuse')
source=("hypocorism-${_pkgname}-${pkgver}.tar.gz")
md5sums=('e0be848bff910f461dabe61ad0ed693b')
conflicts=('xwii')
replaces=('xwii')
provides=('xwii')

build() {
	cd "$srcdir"

	g++ main.cpp -c
	g++ xinterpret.cpp -c
	g++ actionset.cpp -c

	g++ main.o xinterpret.o actionset.o -o xwii -L. -lbluetooth -ldl -lXtst -lwiiuse

	mkdir -p $pkgdir/usr/share/xwii
	cp -r profiles LICENSE start_xwii.py xwii $pkgdir/usr/share/xwii	

	mkdir -p $pkgdir/usr/bin
	ln -s /usr/share/xwii/xwii $pkgdir/usr/bin/xwii
	ln -s /usr/share/xwii/start_xwii.py $pkgdir/usr/bin/start_xwii
}
