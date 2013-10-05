# Maintainer: Andres Erbsen <andres@krutt.org>

pkgname=baseconvert-git
pkgver=0.1
pkgrel=2
pkgdesc="Asymptotically efficient conversion between bases 2..256"
arch=('i686' 'x86_64')
depends=('glibc')
makedepends=('git' 'libtommath') 
url="https://github.com/andres-erbsen/baseconvert"
license=('GPL3')
source=("git+https://github.com/andres-erbsen/baseconvert.git")
md5sums=('SKIP')

build() {
	cd "$srcdir/baseconvert"
	make
}

package() {
	cd "$srcdir/baseconvert"
	prefix="$pkgdir" make install
}

