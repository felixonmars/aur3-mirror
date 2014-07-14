# Maintainer: Joel Teichroeb <joel@teichroeb.net>

pkgname=stack-git
pkgver=r498.60370c0
pkgrel=2
pkgdesc='A static checker for identifying unstable code.'
arch=(i686 x86_64)
url='https://github.com/xiw/stack'
license=('MIT')
depends=('llvm' 'clang' 'python')
makedepends=('git')
source=(git://github.com/xiw/stack)
sha1sums=('SKIP')

pkgver() {
	cd stack
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd stack
	autoreconf -fvi
	mkdir build
	cd build
	../configure --prefix=/usr
	make
}

package() {
    cd stack/build
    make DESTDIR="${pkgdir}" install
	cp -rL bin $pkgdir/usr/bin
}
