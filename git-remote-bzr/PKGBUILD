# Maintainer: Felipe Contreras <felipe.contreras@gmail.com>

pkgname=git-remote-bzr
pkgver=0.2
pkgrel=2
pkgdesc="Bidirectional bridge between Git and Bazaar"
arch=(i686 x86_64)
url="https://github.com/felipec/git-remote-bzr"
license=('GPL2')
depends=('git' 'bzr')
makedepends=('asciidoc')
source=("https://github.com/felipec/git-remote-bzr/archive/v${pkgver}.tar.gz")

build () {
	cd "$srcdir/${pkgname}-${pkgver/+/-}"
	make all doc
}

check () {
	cd "$srcdir/${pkgname}-${pkgver/+/-}"
	make test
}

package () {
	cd "$srcdir/${pkgname}-${pkgver/+/-}"
	make prefix=/usr DESTDIR="$pkgdir" install install-doc
}

md5sums=('bdadd91e7ac3183ec670acd9f5b720a1')
