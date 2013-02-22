# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>

pkgname=drupal-de
_language=de
pkgver=7.20
pkgrel=1
pkgdesc="German language internationalization for Drupal"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
sha512sums=('15b9ff43eb1146c50b4461c2c8d9fc2019493a41256390dc6d02a995102a58b8a52f1d6ccc5ff7bc0af8fbb9c8d41c3f31d1fafebb4de8669dde0fb652fc5e37')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-${pkgver}.${_language}.po")
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}

# vim:set ts=4 sw=4 et:
