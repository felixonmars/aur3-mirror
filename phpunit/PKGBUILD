# Maintainer: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>

pkgname=phpunit
pkgver=4.3.5
pkgrel=1
pkgdesc="PHPUnit is a programmer-oriented testing framework for PHP."
url="http://phpunit.de"
arch=('any')
license=('custom')
depends=('php')
install='phpunit.install'
source=("https://phar.phpunit.de/phpunit-${pkgver}.phar"
        "https://raw.githubusercontent.com/sebastianbergmann/phpunit/${pkgver}/LICENSE"
        'phpunit.install')
md5sums=('f7a3e610b7351a0e3e04e6c3e2efadf9'
         '01b410a927527be5ab60ccdcf75477a0'
         'b46c539c898e61924892913eb7099201')

package() {
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  install -D -m 755 "${srcdir}/phpunit-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/phpunit.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s /usr/share/webapps/bin/phpunit.phar "${pkgdir}/usr/bin/phpunit"
}

# vim:set ts=2 sw=2 et:
