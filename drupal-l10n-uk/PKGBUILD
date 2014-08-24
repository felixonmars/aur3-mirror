# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-uk
_language=uk
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Ukrainian"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.uk.po")
md5sums=('5f9178a915f0e5679693542b14e45683')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
