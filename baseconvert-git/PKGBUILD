# Maintainer: Andres Erbsen <andres@krutt.org>

pkgname=baseconvert-git
pkgver=0.1.r0.g22eb70f
pkgrel=1
pkgdesc="Asymptotically efficient conversion between bases 2..256"
arch=('i686' 'x86_64')
depends=('glibc')
makedepends=('git' 'libtommath') 
url="https://github.com/andres-erbsen/baseconvert"
license=('GPL3')
source=("$pkgname"::"git+https://github.com/andres-erbsen/baseconvert.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --always --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	prefix="$pkgdir" make install
}

