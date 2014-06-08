pkgname=phpbb3-lang-de-x-sie
pkgver=3.0.12
_realver=3_0_12
_pkg_id=91421
pkgrel=1
pkgdesc="German‎ Language Pack for phpBB3 (Formal Honorifics)"
arch=('any')
url="https://www.phpbb.com/customise/db/translation/german_formal_honorifics/"
license=('GPL')
depends=('phpbb3=3.0.12')
source=("https://www.phpbb.com/customise/db/download/id_${_pkg_id}")
md5sums=('d209f53d73e9843096e62115b40531eb')

package() {
  install -d  ${pkgdir}/usr/share/webapps/phpbb3/
  cp -a $srcdir/german_formal_honorifics_${_realver}/* ${pkgdir}/usr/share/webapps/phpbb3/
}
