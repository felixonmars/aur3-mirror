pkgname=phpbb3-lang-es-x-tu
pkgver=1.0.6
_realver=1_0_6
_pkg_id=92696
pkgrel=1
pkgdesc="Spanish Language Pack for phpBB3 (Casual Honorifics)"
arch=('any')
url="https://www.phpbb.com/customise/db/translation/spanish_casual_honorifics/"
license=('GPL')
depends=('phpbb3=3.0.12')
source=("https://www.phpbb.com/customise/db/download/id_${_pkg_id}")
md5sums=('2ae2238ebcd70af6f05beaeaa52e35d9')

package() {
  install -d  ${pkgdir}/usr/share/webapps/phpbb3/
  cp -a $srcdir/spanish_casual_honorifics_${_realver}/* ${pkgdir}/usr/share/webapps/phpbb3/
}
