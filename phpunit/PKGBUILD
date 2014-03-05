# Maintainer: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>

pkgname=phpunit
pkgver=3.7.32
pkgrel=4
pkgdesc="PHPUnit is a programmer-oriented testing framework for PHP."
url="http://phpunit.de"
arch=('x86_64' 'i686')
license=('custom')
depends=('php')
install='phpunit.install'
source=("https://phar.phpunit.de/phpunit-${pkgver}.phar"
        "https://raw2.github.com/sebastianbergmann/phpunit/${pkgver}/LICENSE"
        'phpunit.install')
md5sums=('ef78210ed146f95914f6a94aa3b67a12'
         '01b410a927527be5ab60ccdcf75477a0'
         'b46c539c898e61924892913eb7099201')

package() {
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  install -D -m 755 "${srcdir}/phpunit-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/phpunit.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s /usr/share/webapps/bin/phpunit.phar "${pkgdir}/usr/bin/phpunit"
}

# vim:set ts=2 sw=2 et:
