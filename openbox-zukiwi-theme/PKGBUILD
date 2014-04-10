# Maintainer: Robert Orzanna <orschiro at gmail dot com>

pkgname=openbox-zukiwi-theme
pkgver=20140408
pkgrel=1
pkgdesc="Zukiwi OpenBox Theme. Provides also a perfect fit with GTK theme Zukitwo 3.12."
arch=('any')
url="http://box-look.org/content/show.php/?content=161681"
license=('Creative Commons by-sa')
source=(http://box-look.org/CONTENT/content-files/161681-Zukiwi-ob.obt)
md5sums=('42234c12e32d3c2384287fb4258c8104')

package() {
  install -dm755 "$pkgdir"/usr/share/themes/

  cp -r "$srcdir"/Zukiwi-ob "$pkgdir"/usr/share/themes/
}