# Maintainer: Czipperz <czipperz@gmail.com>
pkgname=pgem-git
pkgver=1.0
pkgrel=7
pkgdesc="An overhead for ruby's 'gem' that uses the pacman-style commands"
url="http://github.com/czipperz/pgem"
arch=('any')
depends=('ruby')
makedepends=('git')
conflicts=()
backup=()
sources=()

package() {
	cd "$srcdir"
	git clone https://github.com/czipperz/pgem
	mkdir -p "$pkgdir"/usr/bin
	install -m755 -T "$srcdir"/pgem/pgem "$pkgdir"/usr/bin/pgem
}
