# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=docblox
pkgver=0.18.1
pkgrel=1
_abstractver=80d829deb5892f209a85f83ae3a7ea3e6f174310
_blackver=ea5b463ca0c08fb86420448547a8bc9e2596dc1f
pkgdesc="PHP 5.3 compatible API Documentation generator aimed at larger projects and Continuous Integration"
arch=("any")
url="http://docblox-project.org"
license=('CUSTOM')
depends=('php-xsl' 'graphviz')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/tarball/v$pkgver"
	"$pkgname-template.abstract-$_abstractver.tar.gz::https://github.com/$pkgname/template.abstract/tarball/$_abstractver"
	"$pkgname-template.new_black-$_blackver.tar.gz::https://github.com/$pkgname/template.new_black/tarball/$_blackver"
	docblox-bin.patch
)

build() {
	cd "${srcdir}/docblox-docblox-eac191b"

	install -m0755 -d "$pkgdir/usr/share/pear/$pkgname"
	cp -RH data docs src README.md "$pkgdir/usr/share/pear/$pkgname"
	install -m0644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	patch -p0 -i "$srcdir/docblox-bin.patch"
	install -m0755 -D bin/docblox.php "$pkgdir/usr/bin/docblox"

	rm -r "$pkgdir/usr/share/pear/$pkgname/data/templates/abstract"
	mv "$srcdir/docblox-template.abstract-${_abstractver:0:7}" "$pkgdir/usr/share/pear/$pkgname/data/templates/abstract"

	rm -r "$pkgdir/usr/share/pear/$pkgname/data/templates/new_black"
	mv "$srcdir/docblox-template.new_black-${_blackver:0:7}" "$pkgdir/usr/share/pear/$pkgname/data/templates/new_black"
}

md5sums=('278c9d34b7bdb537edecd43202f8372c'
         '393d9485c220e233963de0afed3cb2f5'
         '5455ea065e8c78350265575a64c69ca2'
         '8b2940f3db760983d81d82b5300483ed')
