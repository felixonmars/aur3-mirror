# Maintainer:  perlawk
pkgname=picometac
pkgver=1.0
pkgrel=1 
pkgdesc='pico meta evaluator in C'
url="http://pico.vub.ac.be/mc/index.html"
arch=('i686' 'x86_64')
license=('user')
depends=()

source=( https://github.com/jeroenheymans/Pico-C/archive/master.zip)

build() {
	cd "$srcdir"/Pico-C-master
	make all
}

package() {
	mkdir -p "$pkgdir"/usr/bin
	mkdir -p "$pkgdir"/usr/share/man/man1
	cd "$srcdir"/Pico-C-master
	cp tpico/tpico "$pkgdir"/usr/bin/
	cp tpico/tpico.1 "$pkgdir"/usr/share/man/man1
	gzip "$pkgdir"/usr/share/man/man1/tpico.1
}

md5sums=('9b98d248b23c1095b817723db3ceeff9')
