# Maintainer: Hedede <haddayn@gmail.com>

pkgname=xfwm4-theme-royale
pkgver=20070626
pkgrel=1
pkgdesc="Based on Royale theme the MS Windows XP, ported to xfwm4."
arch=('any')
url="http://www.xfce-look.org/content/show.php/Royal+XFWM4?content=61186"
license=('')
depends=('xfwm4')
source=(http://xfce-look.org/CONTENT/content-files/61186-Royale.tar.gz)
md5sums=('a888071cb344dd741d4cbadb6438d9c1')

package() {
  install -d ${pkgdir}/usr/share/themes
  cp -r ${srcdir}/Royale  ${pkgdir}/usr/share/themes
}
