# Maintainer: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>

pkgname=gush
pkgver=1.3.8
pkgrel=6
pkgdesc="Rapid workflow for GitHub project maintainers and contributors"
url="http://gushphp.org"
arch=('x86_64' 'i686')
license=('mit')
makedepends=('php-box' 'php-composer')
depends=('php')
install=gush.install
source=("https://github.com/gushphp/gush/archive/v${pkgver}.tar.gz"
  "https://raw.github.com/gushphp/gush/v${pkgver}/LICENSE"
  'box.json.dist.patch'
  'Application.php.patch'
  'gush.install'
  'php.ini')
md5sums=('50fb6c842c1edc38189c49b8c47a8a19'
         '1174709e6ca02e0fd599fb48fac19c17'
         '1ac5c23f8ec3a91f18066d1ab591a215'
         'ab531d50ac9577b15b18c17729d3b2e5'
         '815d4cb9830b89a20f89e7d78be11ea5'
         '9f045ab195adda32252a3c12c8f4430a')

build() {
  cd "${srcdir}/gush-${pkgver}"
  /usr/bin/php -c "${srcdir}/php.ini" /usr/bin/composer install --no-dev
  patch -p0 <"${srcdir}/box.json.dist.patch"
  patch -p0 <"${srcdir}/Application.php.patch"
  /usr/bin/php -c "${srcdir}/php.ini" /usr/bin/php-box build

  # black magic to fix the phar before changing it's owner to root
  ./gush.phar --version
}

package() {
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  install -D -m 755 "${srcdir}/gush-${pkgver}/gush.phar" "${pkgdir}/usr/share/webapps/bin/gush.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s /usr/share/webapps/bin/gush.phar "${pkgdir}/usr/bin/gush"
}

# vim:set ts=2 sw=2 et:
