# Maintainer: Caleb Maclennan <caleb@alerque.com>
#
# Any suggestions welcome; please submit paches via Github:
# https://github.com/alerque/aur/tree/master/php-refactoring-browser

pkgname=php-refactoring-browser
pkgver=0.0.4
pkgrel=1
pkgdesc="A command line refactoring tool for PHP"
url="http://qafoolabs.github.com/php-refactoring-browser"
license="MIT"
arch=("any")
depends=("php")
source=("https://github.com/QafooLabs/php-refactoring-browser/releases/download/v${pkgver}/refactor.phar")
md5sums=('c4ac63055a65bd3cff3555b82e5d966c')

package() {
    install -D -m755 $srcdir/refactor.phar $pkgdir/usr/share/webapps/bin/php-refactoring-browser.phar

    install -d $pkgdir/usr/bin
    ln -s /usr/share/webapps/bin/php-refactoring-browser.phar $pkgdir/usr/bin/php-refactoring-browser
}
