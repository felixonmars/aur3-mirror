# Maintainer: Maciek <maciekwer at wp dot pl>

pkgname=samsung_cms
pkgver=20101001
pkgrel=2
pkgdesc="CMS files that are needed by SpliX for colour printing."
arch=('any')
url="http://splix.ap2c.org/"
license=('custom:samsung')
depends=('splix')
source=(http://splix.ap2c.org/$pkgname.tar.bz2)
md5sums=('51bf60a93575eb392ed6ad5d43e00e36') 

package() {
  mkdir -p $pkgdir/usr/share/cups/model/samsung/cms
  install -m 444 $srcdir/cms/* $pkgdir/usr/share/cups/model/samsung/cms/
}
