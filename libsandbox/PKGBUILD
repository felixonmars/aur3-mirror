# Maintainer: Kelvin Ng (qpalz) <kelvin9302104 at gmail dot com>

pkgname=libsandbox
pkgver=0.3.5
pkgrel=1
pkgdesc="libsandbox is an open-source suite of software components for C/C++ developers to create automated profiling tools and watchdog programs."
arch=('i686' 'x86_64')
url="https://openjudge.net/Solution/Sandbox"
license=('BSD')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('8a8b9b9370a3c747ed9c284dd97e8290')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make prefix="$pkgdir/usr/" install
}

