pkgname=phpbb3-lang-sv
pkgver=1.4.8
_realver=1_4_8
_pkg_id=94846
pkgrel=1
pkgdesc="Swedish Language Pack for phpBB3"
arch=('any')
url="https://www.phpbb.com/customise/db/translation/svenska/"
license=('GPL')
depends=('phpbb3=3.0.12')
source=("https://www.phpbb.com/customise/db/download/id_${_pkg_id}")
md5sums=('e0044422e5fc5436169eff2a9e726eb0')

package() {
  install -d  ${pkgdir}/usr/share/webapps/phpbb3/
  cp -a $srcdir/svenska_${_realver}/* ${pkgdir}/usr/share/webapps/phpbb3/
}
