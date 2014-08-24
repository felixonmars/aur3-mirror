# Maintainer: James An <james@jamesan.ca>

pkgname=drupal-l10n-cs
_language=cs
pkgver=7.31
pkgrel=1
pkgdesc="Drupal core translation: Czech"
arch=('any')
url="http://localize.drupal.org/translate/downloads"
_watch="http://localize.drupal.org/translate/downloads"
license=('nonfree')
depends=('drupal')
source=("http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.31.cs.po")
md5sums=('4ac5cb091168cde6c510de1098411abc')
package () {
    install -Dm644 "${srcdir}/drupal-${pkgver}.${_language}.po" "${pkgdir}/usr/share/webapps/drupal/profiles/standard/translations/drupal-${pkgver}.${_language}.po"
}
