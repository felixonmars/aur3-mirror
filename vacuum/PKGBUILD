# Maintainer: Mijo Medvedec <mijo dot medvedec at gmail dot com>
# Contributor: Timur Antipin <mooxtim at yandex dot ru>

pkgname=vacuum
pkgver=1.2.4
pkgrel=1
pkgdesc="cross-platform qt-based jabber client"
arch=('i686' 'x86_64')
url="https://code.google.com/p/vacuum-im/"
license=('GPL3')
depends=('qt4' 'openssl' 'qtwebkit' 'libidn' 'libxss')
makedepends=('cmake')
provides=('vacuum')
conflicts=('vacuum-svn')
source=("https://googledrive.com/host/0B7A5K_290X8-d1hjQmJaSGZmTTA/$pkgname-$pkgver.tar.gz")
md5sums=('be949999dfe05695f2d1434096d46717')
sha256sums=('0e66eadd35ae43a4164d81873161f96be558e27eca8209a962f829b596bb1d83')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -p build-"$pkgname"
	cd build-"$pkgname"
	cmake -DCMAKE_INSTALL_PREFIX=/usr \
	      -DCMAKE_BUILD_TYPE=Release \
	      -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
	..
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver/build-$pkgname"
	make DESTDIR="$pkgdir/" install
}
