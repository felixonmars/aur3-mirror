# Maintainer: beest <gnubeest@gmail.com>
pkgname=romextract-git
pkgver=r2.00f1a85
pkgrel=2
pkgdesc="various Linux tools for extracting ROMs from Wii Virtual Console WADs"
arch=('i686' 'x86_64')
url="https://github.com/Plombo/romextract"
license=('unknown')
depends=('python2') 
makedepends=('git')
source=("$pkgname::git://github.com/Plombo/romextract.git")
md5sums=('SKIP')
pkgver() {
	        cd "$pkgname"
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
	sed -i '1 s/python/python2/' "$pkgname/src/nes_rom_extract.py"
}	
build() {
	cd "$pkgname"
	./build.sh
}
package() {
	cd "$pkgname/bin"
	install -Dm755 ccfextract nes_rom_extract romc u8it wadunpacker -t "$pkgdir"/usr/bin
}
