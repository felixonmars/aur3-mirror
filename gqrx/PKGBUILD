# Maintainer: Dominik Heidler <dheidler@gmail.com>

pkgname=gqrx
pkgver=2.2.1
pkgrel=2
pkgdesc="SDR receiver for Funcube Dongle, RTL-SDR, USRP and OsmoSDR devices"
arch=('i686' 'x86_64')
url="http://gqrx.dk/"
license=('GPL')
depends=('qt5-svg' 'libpulse' 'gr-osmosdr' 'libxkbcommon-x11')
makedepends=('boost' 'git')
install='gqrx.install'
#source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/csete/gqrx/tar.gz/v$pkgver" "${pkgname}.png" "${pkgname}.desktop")
source=("git://github.com/csete/gqrx.git#commit=eca0ea7163ff16abd698737fc8ac1baab21be668" "${pkgname}.png" "${pkgname}.desktop")

build() {
	#cd "$srcdir/$pkgname-$pkgver"
	cd "$srcdir/$pkgname"
	rm -rf build
	mkdir build
	cd build
	qmake PREFIX=/usr/ ..
	make
}

package() {
	cd $srcdir

	install -D -m644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	install -D -m644 $pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png

	#cd "$pkgname-$pkgver/build"
	cd "$pkgname/build"

	make install INSTALL_ROOT=$pkgdir
}

md5sums=('SKIP'
         'f7032a8883c89bd80e0d0fd36f861c59'
         '810f89195231c18f32af92522aade721')
