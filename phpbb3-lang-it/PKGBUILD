pkgname=phpbb3-lang-it
pkgver=1.2.2
_realver=1_2_2
_pkg_id=91861
pkgrel=3
pkgdesc="Italian Language Pack for phpBB3"
arch=('any')
url="https://www.phpbb.com/customise/db/translation/italian/"
license=('GPL')
depends=('phpbb3=3.0.12')
source=("https://www.phpbb.com/customise/db/download/id_${_pkg_id}")
md5sums=('156de7eba20d9496790d2df228d40bd4')

package() {
  install -d  ${pkgdir}/usr/share/webapps/phpbb3/
  cp -a $srcdir/italian_${_realver}/* ${pkgdir}/usr/share/webapps/phpbb3/
}
