# Maintainer: Felipe Contreras <felipe.contreras@gmail.com>

pkgname=git-remote-hg
pkgver=0.2
pkgrel=2
pkgdesc="Bidirectional bridge between Git and Mercurial"
arch=(i686 x86_64)
url="https://github.com/felipec/git-remote-hg"
license=('GPL2')
depends=('git' 'mercurial')
makedepends=('asciidoc')
source=("https://github.com/felipec/git-remote-hg/archive/v${pkgver}.tar.gz")

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

md5sums=('a424e2f26da9c6074982934111beb4dd')
