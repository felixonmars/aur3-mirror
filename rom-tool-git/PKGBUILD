# Maintainer: ceri
pkgname=rom-tool-git
pkgver=3.1
pkgrel=1
pkgdesc="Describes and manipulates Nintendo 3DS ROMs/CIIs (CTR Cartridge Images)"
arch=('i686' 'x86_64')
url="http://gbatemp.net/threads/3ds-rom-tool-rom_tool.349314/"
license=('unknown')
makedepends=('git')
options=()
source=('git://github.com/ps3hen/ctr_toolkit.git')
md5sums=('SKIP')
_gitpath='ctr_toolkit/rom_tool'

pkgver() {
	cd "$srcdir/$_gitpath"
	local major="$(grep -o "MAJOR = [0-9]" main.c | grep -o "[0-9]")"
	local minor="$(grep -o "MINOR = [0-9]" main.c | grep -o "[0-9]")"
	echo $major.$minor	
}

build() {
	cd "$srcdir/$_gitpath"
	make
}

package() {
	cd "$srcdir/$_gitpath"
	install -D -m 755 rom_tool $pkgdir/usr/bin/rom_tool
}
