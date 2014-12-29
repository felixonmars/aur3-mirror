pkgname=php-codesniffer-prestashop-git
pkgver=r15.fd3dda1
pkgrel=1
pkgdesc='PrestaShop coding standard for PHP_CodeSniffer'
arch=('any')
url='http://doc.prestashop.com/display/PS15/Coding+Standards'
license=('custom')
depends=('php-codesniffer')
provides=('php-codesniffer-prestashop')
conflicts=('php-codesniffer-prestashop')
source=('php-codesniffer-prestashop-git::git+https://github.com/PrestaShop/PrestaShop-norm-validator')
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -d "$pkgdir"/usr/share/pear/PHP/CodeSniffer/Standards/PrestaShop
    cp -dr --no-preserve=ownership "$srcdir"/"$pkgname"/* "$pkgdir"/usr/share/pear/PHP/CodeSniffer/Standards/PrestaShop/
}

