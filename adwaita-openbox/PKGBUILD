# Maintainer: Robert Orzanna <orschiro at gmail dot com>

pkgname=adwaita-openbox
pkgver=1.0
pkgrel=1
pkgdesc="Adwaita OpenBox Theme"
arch=('any')
url="http://box-look.org/content/show.php?content=162700"
license=('LGPL')
source=(http://box-look.org/CONTENT/content-files/162700-adwaita-ob.obt)
md5sums=('c465c75a3342cd31137518c44dcc1336')

package() {
  install -dm755 "$pkgdir"/usr/share/themes/

  cp -r "$srcdir"/adwaita-ob "$pkgdir"/usr/share/themes/
}