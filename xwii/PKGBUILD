# Maintainer: Matthew Bauer <mjbauer95@gmail.com>
pkgname=xwii
_pkgname=Xwii
pkgver=2.9.4
pkgrel=1
pkgdesc="XWii lets you control your Linux desktop with the Nintendo Wii Remote."
arch=(i686 x86_64)
url="http://sourceforge.net/projects/$pkgname"
license=('custom')
depends=('python' 'wiiuse')
source=("http://downloads.sourceforge.net/project/$pkgname/${pkgname}_${pkgver}_src.tar.gz")
conflicts=('xwii-hypocorism' 'xwii-svn')
md5sums=('8b1ab2b4b75994d200581d54305d759e')

build() {
	cd "$srcdir/${pkgname}_${pkgver}_src"

	g++ main.cpp -c
	g++ xinterpret.cpp -c
	g++ actionset.cpp -c

	g++ main.o xinterpret.o actionset.o -o xwii -L. -lbluetooth -ldl -lXtst -lwiiuse

	mkdir -p $pkgdir/usr/share/xwii
	cp -r Documentation profiles LICENSE start_xwii.py xwii $pkgdir/usr/share/xwii	

	mkdir -p $pkgdir/usr/bin
	ln -s /usr/share/xwii/xwii $pkgdir/usr/bin/xwii
	ln -s /usr/share/xwii/start_xwii.py $pkgdir/usr/bin/start_xwii
}
