# $Id: PKGBUILD 165345 2012-08-16 02:47:11Z dan $
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=git-subtree
pkgver=1.9.1
pkgrel=1
pkgdesc="Merges and splits subtrees from your git project into subprojects and back"
arch=('any')
url="http://git-scm.com/"
license=('GPL2')
depends=('git')
makedepends=('asciidoc' 'xmlto')
source=("https://www.kernel.org/pub/software/scm/git/git-$pkgver.tar.xz")

build() {
	cd "$srcdir/git-$pkgver/contrib/subtree"
	make prefix=/usr all doc
}

package() {
	cd "$srcdir/git-$pkgver/contrib/subtree"
	sed "s|libexec/git-core|lib/git-core|" -i Makefile
	install -dm755 "$pkgdir/usr/lib/git-core"
	make prefix=/usr DESTDIR="$pkgdir" install install-doc
}

md5sums=('d65ca55041898c226e532425fc673035')
