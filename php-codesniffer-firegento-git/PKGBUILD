# Maintainer: Stephan Wienczny <stephan@wienczny.de>

pkgname=php-codesniffer-firegento-git
pkgver=r14.aa53499
pkgrel=1
pkgdesc='FireGento coding standard for PHP_CodeSniffer'
arch=('any')
url='https://github.com/firegento/phpcs'
license=('custom')
depends=('php-codesniffer')
provides=('php-codesniffer-firegento')
conflicts=('php-codesniffer-firegento')
source=('php-codesniffer-firegento-git::git+https://github.com/firegento/phpcs')
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -d "$pkgdir"/usr/share/pear/PHP/CodeSniffer/Standards/FireGento
    cp -dr --no-preserve=ownership "$srcdir"/"$pkgname"/FireGento "$pkgdir"/usr/share/pear/PHP/CodeSniffer/Standards/
}

