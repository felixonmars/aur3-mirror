pkgname=phpbb3-lang-es-mx
pkgver=1.0.5
_realver=1_0_5
_pkg_id=92146
pkgrel=1
pkgdesc="Mexican Spanish Language Pack for phpBB3"
arch=('any')
url="https://www.phpbb.com/customise/db/translation/mexican_spanish_casual_honorifics/"
license=('GPL')
depends=('phpbb3=3.0.12')
source=("https://www.phpbb.com/customise/db/download/id_${_pkg_id}")
md5sums=('e89db8a2982e0a2e9730333d823ad76c')

package() {
  install -d  ${pkgdir}/usr/share/webapps/phpbb3/
  cp -a $srcdir/mexican_spanish_casual_honorifics_${_realver}/* ${pkgdir}/usr/share/webapps/phpbb3/
}
