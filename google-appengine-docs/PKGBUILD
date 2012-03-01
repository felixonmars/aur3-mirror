# Contributor: solsTiCe d'Hiver <solstice.dhiver@gmail.com>
# Contributor: Hervé Cauwelier <herve@oursours.net>

pkgname=google-appengine-docs
pkgver=20120228
pkgrel=1
pkgdesc="Google App Engine documentation"
arch=(any)
url="http://code.google.com/appengine/"
license=('custom:CC-BY-3.0' 'Apache')
source=(http://googleappengine.googlecode.com/files/google-appengine-docs-$pkgver.zip)
options=(!strip)
md5sums=('65197db93808251cf59713ce149a1ba8')

package() {
  mkdir -p "$pkgdir/opt/google-appengine/doc/"
  cp -a "$srcdir"/google-appengine-docs-$pkgver/* "$pkgdir/opt/google-appengine/doc/"
  # no executable needed in documentation directory
  find "$pkgdir" -type f -perm 755 -exec chmod 644 {} \;
}
# vim:set ts=2 sw=2 et:
