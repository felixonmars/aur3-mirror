# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-en-gb
_language=en-gb
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: English, British"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.en-gb.po")
md5sums=('b26b86e9deead3aa34dee4632c6df329')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
