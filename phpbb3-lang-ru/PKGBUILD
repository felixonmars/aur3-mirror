pkgname=phpbb3-lang-ru
pkgver=1.0.11
_realver=1_0_11
_pkg_id=91291
pkgrel=3
pkgdesc="Russian Language Pack for phpBB3"
arch=('any')
url="https://www.phpbb.com/customise/db/translation/russian/"
license=('GPL')
depends=('phpbb3=3.0.12')
source=("https://www.phpbb.com/customise/db/download/id_${_pkg_id}")
md5sums=('45aa4adc3f7bdd1b79cd67d8e6a52c2e')

package() {
  install -d  ${pkgdir}/usr/share/webapps/phpbb3/
  cp -a $srcdir/russian_${_realver}/* ${pkgdir}/usr/share/webapps/phpbb3/
}
