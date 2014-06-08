pkgname=phpbb3-lang-us
pkgver=1.3.0
_realver=1_3_0
_pkg_id=91116
pkgrel=2
pkgdesc="American English Language Pack for phpBB3"
arch=('any')
url="https://www.phpbb.com/customise/db/translation/american_english/"
license=('GPL')
depends=('phpbb3=3.0.12')
source=("https://www.phpbb.com/customise/db/download/id_${_pkg_id}")
md5sums=('24f7ac6977b46051b1af782f42d2545c')

package() {
  install -d  ${pkgdir}/usr/share/webapps/phpbb3/
  cp -a $srcdir/american_english_${_realver}/* ${pkgdir}/usr/share/webapps/phpbb3/
}
