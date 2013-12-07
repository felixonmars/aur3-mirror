# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=epgdump-git
pkgver=0.1.0.24.g6be2f8f
pkgrel=1
pkgdesc="A program to output EPG in xml from MPEG-TS"
arch=('i686' 'x86_64')
url="https://github.com/Piro77/epgdump"
license=('GPL')
depends=('glibc')
makedepends=('git')
provides=('epgdump')
source=("$pkgname"::'git://github.com/Piro77/epgdump.git')
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --tags | sed 's/-/./g'
}

build() {
	cd "$pkgname"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" install
}