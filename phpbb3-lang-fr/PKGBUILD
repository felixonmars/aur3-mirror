pkgname=phpbb3-lang-fr
pkgver=1.4.1
_realver=1_4_1
_pkg_id=91611
pkgrel=1
pkgdesc="French Language Pack for phpBB3"
arch=('any')
url="https://www.phpbb.com/customise/db/translation/french/"
license=('GPL')
depends=('phpbb3=3.0.12')
source=("https://www.phpbb.com/customise/db/download/id_${_pkg_id}")
md5sums=('27d2cf5daef6ffed0ef6bfc3871fb150')

package() {
  install -d  ${pkgdir}/usr/share/webapps/phpbb3/
  cp -a $srcdir/french_${_realver}/* ${pkgdir}/usr/share/webapps/phpbb3/
}
