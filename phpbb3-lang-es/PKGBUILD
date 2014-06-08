pkgname=phpbb3-lang-es
pkgver=1.0.6
_realver=1_0_6
_pkg_id=92601
pkgrel=1
pkgdesc="Spanish Language Pack for phpBB3 (Formal Honorifics)"
arch=('any')
url="https://www.phpbb.com/customise/db/translation/spanish_formal_honorifics/"
license=('GPL')
depends=('phpbb3=3.0.12')
source=("https://www.phpbb.com/customise/db/download/id_${_pkg_id}")
md5sums=('a4181c508c0631441a5105fd632b94e3')

package() {
  install -d  ${pkgdir}/usr/share/webapps/phpbb3/
  cp -a $srcdir/spanish_formal_honorifics_${_realver}/* ${pkgdir}/usr/share/webapps/phpbb3/
}
