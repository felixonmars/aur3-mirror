# Maintainer: Jimmy Bergstrom <thekwarf@gmail.com>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >

pkgname=kwooty
pkgver=1.1.0
pkgrel=1
pkgdesc="A friendly nzb usenet binary downloader for KDE4."
arch=('i686' 'x86_64')
url="http://kwooty.sourceforge.net/"
license=('GPL')
depends=('kdebase-workspace>=4.6')
makedepends=('cmake' 'automoc4')
optdepends=('unrar: automatic RAR-archive extraction'
		'p7zip: automatic zip and 7z archive extraction'
		'par2cmdline: automatic file repairing')
install="${pkgname}.install"
source=(http://downloads.sourceforge.net/project/kwooty/$pkgname-$pkgver.tar.gz)
sha1sums=('b65a6538606985f61313554c536047e9a8db261e')

build() {
	cd $pkgname-$pkgver
	mkdir -p build
	cd build

	cmake .. -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
	make
}

package() {
	cd $pkgname-$pkgver/build
	make DESTDIR="$pkgdir/" install
}
