# Maintainer: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>

pkgname=phpunit
pkgver=3.7.30
pkgrel=3
pkgdesc="PHPUnit is a programmer-oriented testing framework for PHP."
url="http://phpunit.de"
arch=('x86_64' 'i686')
license=('custom')
depends=('php')
install='phpunit.install'
source=("https://github.com/sebastianbergmann/phpunit/releases/download/${pkgver}/phpunit.phar"
        "https://raw2.github.com/sebastianbergmann/phpunit/${pkgver}/LICENSE")
md5sums=('dc347faabf7602fe048bd8838e77e31d'
         '01b410a927527be5ab60ccdcf75477a0')

package() {
  install -D -m 644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
  install -D -m 755 ${srcdir}/phpunit.phar ${pkgdir}/usr/share/php/phpunit.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/php/phpunit.phar ${pkgdir}/usr/bin/phpunit
}

# vim:set ts=2 sw=2 et:
