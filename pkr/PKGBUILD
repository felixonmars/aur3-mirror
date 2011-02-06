# Contributor: T - rttommy@gmail.com
pkgname=pkr
pkgver=0.1
pkgrel=1
pkgdesc="A simple but powerful bash script to handle many archive formats."
url="http://code.google.com/p/pkr/"
arch=('i686' 'x86_64')
license=('MIT')
source=(http://pkr.googlecode.com/files/pkr-$pkgver.tar.bz2)
md5sums=('e96fbdaf8778e958709fa0219dc5db4b')
build() {
	cd "$startdir/src"
	mkdir -p "$startdir/pkg/usr/bin"
	cp ./pkr "$startdir/pkg/usr/bin"
}
