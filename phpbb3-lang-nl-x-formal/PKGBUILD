pkgname=phpbb3-lang-nl-x-formal
pkgver=1.0.5
_realver=1_0_5
_pkg_id=91666
pkgrel=1
pkgdesc="Dutch‎ Language Pack for phpBB3 (Formal Honorifics)"
arch=('any')
url="https://www.phpbb.com/customise/db/translation/dutch_formal_honorifics/"
license=('GPL')
depends=('phpbb3=3.0.12')
source=("https://www.phpbb.com/customise/db/download/id_${_pkg_id}")
md5sums=('186577da55926e6061d06310cebfa11c')

package() {
  install -d  ${pkgdir}/usr/share/webapps/phpbb3/
  cp -a $srcdir/dutch_formal_honorifics_${_realver}/* ${pkgdir}/usr/share/webapps/phpbb3/
}
