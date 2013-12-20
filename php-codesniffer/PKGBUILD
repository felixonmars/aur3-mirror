# Maintainer: Sander Boom <sander at inflowmotion dot nl>
# Contributor: jarosz

pkgname=php-codesniffer
_pkgname=PHP_CodeSniffer
pkgver=1.5.1
pkgrel=1
pkgdesc="PHP_CodeSniffer tokenises PHP, JavaScript and CSS files and detects violations of a defined set of coding standards."
arch=('any')
url="http://pear.php.net/package/PHP_CodeSniffer/"
license=('BSD')
depends=('php')
makedepends=('php-pear')
source=(http://download.pear.php.net/package/${_pkgname}-${pkgver}.tgz)
noextract=("${_pkgname}-${pkgver}.tgz")

md5sums=('1b24b00d9308f5f37db5c7525eba99e7')

package() {
  pear install -P ${pkgdir} ${srcdir}/${_pkgname}-${pkgver}.tgz

  # Remove PEAR channel metadata etc. from the package (which may cause
  # filesystem conflicts), thanks skremiec.
  cd ${pkgdir}/usr/share/pear
  rm -r $(ls -A | grep '^\.')
}
