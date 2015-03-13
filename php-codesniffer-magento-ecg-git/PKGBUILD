# Maintainer: Stephan Wienczny <stephan@wienczny.de>

pkgname=php-codesniffer-magento-ecg-git
pkgver=r30.3adbf31
pkgrel=1
pkgdesc='Magento ECG coding standard for PHP_CodeSniffer'
arch=('any')
url='https://github.com/magento-ecg/coding-standard.git'
license=('custom')
depends=('php-codesniffer')
provides=('php-codesniffer-magento-ecg')
conflicts=('php-codesniffer-magento-ecg')
source=('php-codesniffer-magento-ecg-git::git+https://github.com/magento-ecg/coding-standard.git')
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -d "$pkgdir"/usr/share/pear/PHP/CodeSniffer/Standards/ECG
    cp -dr --no-preserve=ownership "$srcdir"/"$pkgname"/ruleset.xml "$pkgdir"/usr/share/pear/PHP/CodeSniffer/Standards/ECG/
    cp -dr --no-preserve=ownership "$srcdir"/"$pkgname"/Sniffs "$pkgdir"/usr/share/pear/PHP/CodeSniffer/Standards/ECG/
    cp -dr --no-preserve=ownership "$srcdir"/"$pkgname"/Tests "$pkgdir"/usr/share/pear/PHP/CodeSniffer/Standards/ECG/
}

