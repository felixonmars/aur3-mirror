# Maintainer: Theophile BASTIAN (aka. tobast) <contact at tobast dot fr>

pkgname=pastebincl
pkgver=1.0
pkgrel=1
pkgdesc='A command-line tool to submit pastes on http://pastebin.com/'
arch=('i686' 'x86_64')
url='http://tobast.fr/'
license=('GPL3')
depends=('curl')
source=('https://gitorious.org/command-line-pastebin/command-line-pastebin/blobs/raw/c9ac1b511d45bd333b1c4da41f9ed45cb6ad30c8/pastebincl-1.0.tar.gz')
md5sums=('c575120cc9d631bbda41a8d510efcbd7')

build() {
	cd $srcdir/$pkgname-$pkgver
	make
}

package() {
	mkdir -p $pkgdir/usr/
	cd $srcdir/$pkgname-$pkgver
	make prefix="$pkgdir/usr/" install
}

