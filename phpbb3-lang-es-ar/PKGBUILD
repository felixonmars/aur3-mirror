pkgname=phpbb3-lang-es-ar
pkgver=1.0.2
_realver=1_0_2
_pkg_id=91866
pkgrel=1
pkgdesc="Argentinian Spanish Language Pack for phpBB3"
arch=('any')
url="https://www.phpbb.com/customise/db/translation/argentinian_spanish_formal_honorifics/"
license=('GPL')
depends=('phpbb3=3.0.12')
source=("https://www.phpbb.com/customise/db/download/id_${_pkg_id}")
md5sums=('57a47e583f0359eb4609b908ca7ac7be')

package() {
  install -d  ${pkgdir}/usr/share/webapps/phpbb3/
  cp -a $srcdir/argentinian_spanish_formal_honorifics_${_realver}/* ${pkgdir}/usr/share/webapps/phpbb3/
}
