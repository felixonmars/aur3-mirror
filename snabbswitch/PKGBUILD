# Maintainer: Sebastian Korotkiewicz <sebastian@korotkiewicz.eu>

pkgname=snabbswitch
pkgver=1
pkgrel=1
pkgdesc='Snabb Switch: Open source packet processing for ISPs'
url='http://snabb.co/'
license=('GPL')
arch=('i686' 'x86_64')
source=('git+https://github.com/SnabbCo/snabbswitch')
md5sums=('SKIP')
sha1sums=('SKIP')
sha256sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
	git submodule update --init
	make
}

package() {
	cd $pkgname/
	sh src/doc/genbook.sh > snabbswitch.1 
	install -Dm755 src/${pkgname%-*} "$pkgdir"/usr/bin/${pkgname%-*}
	install -Dm755 src/snabb "$pkgdir"/usr/bin/snabb
	install -Dm644 snabbswitch.1 "$pkgdir"/usr/share/man/man1/${pkgname%-*}.1
}


