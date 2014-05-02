# Maintainer: Sebastian Korotkiewicz <sebastian@korotkiewicz.eu>

pkgname=nyancat
pkgver=1
pkgrel=1
pkgdesc='Nyancat rendered with various bits of ANSI'
url='http://nyancat.dakko.us/'
license=('GPL')
arch=('i686' 'x86_64')
source=('git+https://github.com/klange/nyancat')
md5sums=('SKIP')
sha1sums=('SKIP')
sha256sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd $pkgname/
	install -Dm755 src/${pkgname%-*} "$pkgdir"/usr/bin/${pkgname%-*}
	install -Dm644 ${pkgname%-*}.1 "$pkgdir"/usr/share/man/man1/${pkgname%-*}.1
}

