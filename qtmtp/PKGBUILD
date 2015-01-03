# Contributor: Marco Tangaro <marco_tangaro@hotmail.com>

pkgname=qtmtp
pkgver=0.2.0
pkgrel=1
pkgdesc="qtmtp is a small tool to manage files on mtp capable MP3-players, it allows upload, download and deleting with this devices in many cases in batch-mode too"
arch=('i686' 'x86_64')
url="http://www.opendesktop.org/content/show.php/qtmtp?content=106434"
license=('GPL')
depends=('libmtp' 'taglib' 'qt4')
makedepends=('gcc' 'make')
source=("http://www.opendesktop.org/CONTENT/content-files/106434-$pkgname-$pkgver.tar.gz")
md5sums=('9a68115829f76359228f87f904139aa3')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	install -Dm755 "$srcdir/$pkgname-$pkgver/src/qtmtp" "$pkgdir/usr/bin/qtmtp"
}