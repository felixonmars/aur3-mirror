pkgname=phpbb3-lang-ua
pkgver=1.0.9
_realver=1_0_9
_pkg_id=92276
pkgrel=2
pkgdesc="Ukrainian Language Pack for phpBB3"
arch=('any')
url="https://www.phpbb.com/customise/db/translation/ukrainian/"
license=('GPL')
depends=('phpbb3=3.0.12')
source=("https://www.phpbb.com/customise/db/download/id_${_pkg_id}")
md5sums=('ede3238ac332e28a9651aead37437da2')

package() {
  install -d  ${pkgdir}/usr/share/webapps/phpbb3/
  cp -a $srcdir/ukrainian_${_realver}/* ${pkgdir}/usr/share/webapps/phpbb3/
}
