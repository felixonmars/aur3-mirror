# Maintainer: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>

pkgname=gush
pkgver=1.14.4
pkgrel=1
pkgdesc="Rapid workflow for GitHub project maintainers and contributors"
url="http://gushphp.org"
arch=('any')
license=('MIT')
makedepends=('php-box' 'php-composer')
depends=('php')
source=("https://github.com/gushphp/gush/archive/${pkgver}.tar.gz")
md5sums=('62e5be59f1ecba9ce6e0e13c4f8d827a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  composer install --no-dev
  sed -i "s/@package_version@/${pkgver}/" "${srcdir}/${pkgname}-${pkgver}/src/Application.php"
  php-box build
  ./gush.phar --version
}

package() {
  install -D -m 755 "${srcdir}/gush-${pkgver}/gush.phar" "${pkgdir}/usr/share/webapps/bin/gush.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s /usr/share/webapps/bin/gush.phar "${pkgdir}/usr/bin/gush"
}

# vim:set ts=2 sw=2 et:
