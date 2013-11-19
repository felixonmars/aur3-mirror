# Maintainer: Robert Orzanna <orschiro at gmail dot com>

pkgname=openbox-adwaita-theme
pkgver=20130116
pkgrel=1
pkgdesc="Adwaita OpenBox Theme"
arch=('any')
url="http://box-look.org/content/show.php/?content=155042"
license=('LGPL')
source=(http://box-look.org/CONTENT/content-files/155042-Adwaita-openbox.obt)
md5sums=('41c21b11f05f0e8f2ff32e1ad4a27252')

package() {
  install -dm755 "$pkgdir"/usr/share/themes/

  cp -r "$srcdir"/Adwaita-openbox "$pkgdir"/usr/share/themes/
}