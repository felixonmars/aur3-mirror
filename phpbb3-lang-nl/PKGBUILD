pkgname=phpbb3-lang-nl
pkgver=1.0.13.1
_realver=1_0_13_1
_pkg_id=91751
pkgrel=1
pkgdesc="Dutch‎ Language Pack for phpBB3 (Casual Honorifics)"
arch=('any')
url="https://www.phpbb.com/customise/db/translation/dutch_casual_honorifics/"
license=('GPL')
depends=('phpbb3=3.0.12')
source=("https://www.phpbb.com/customise/db/download/id_${_pkg_id}")
md5sums=('af2c50989e1fe6b46f3dc3f105553eb0')

package() {
  install -d  ${pkgdir}/usr/share/webapps/phpbb3/
  cp -a $srcdir/dutch_casual_honorifics_${_realver}/* ${pkgdir}/usr/share/webapps/phpbb3/
}
