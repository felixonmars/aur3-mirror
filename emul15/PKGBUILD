# Maintainer: Fabian Stein <fenstein12@googlemail.com>
pkgname=emul15
pkgver=git
pkgrel=1
pkgver=latest
pkgdesc="A 4bit CPU emulator - Git"
arch=('any')
url="https://github.com/stone3311/Emul15"
license=('GPL3')
depends=('python3')
makedepends=('nuitka')

prepare() {
        rm -rf /tmp/emul15-src
        git clone https://github.com/stone3311/Emul15.git /tmp/emul15-src
}

build() {
	cd "/tmp/emul15-src"
	make
}

package() {
	cd "/tmp/emul15-src"
	mkdir $pkgdir/usr
	mkdir $pkgdir/usr/bin
	mv /tmp/emul15-src/build/Emul15/emul15 $pkgdir/usr/bin/
	mv /tmp/emul15-src/build/Assembler/asm15 $pkgdir/usr/bin/
	mv /tmp/emul15-src/build/Compiler/com15 $pkgdir/usr/bin
}
