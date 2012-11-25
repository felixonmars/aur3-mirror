# Maintainer: Benjamin Bolton benjamin@bennybolton.com

pkgname=keyd
pkgver=0.4.0
pkgrel=1
pkgdesc="Hot key daemon independent of X11"
arch=('i686' 'x86_64')
url="https://bennybolton.com/"
license=('GPL3')
depends=(glibc)
makedepends=(gcc)
backup=('etc/keyd.conf')
source=("ftp://bennybolton.com/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('9bc2fe74f5f3df9bc1a9c4e7dd81f98b')

build(){
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package(){
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
